--エフェクト・ヴェーラー
--Effect Veiler (Pre-Errata)
--HAT: PGLD text ("negate that opponent's face-up monster's effects until the End Phase").
--HAT End Phase procedure (TCG rules before the Oct. 2014 errata): the negation ends during the End Phase.
--Optional effects of the target can wait until it ends, so they are NOT negated in the End Phase (e.g. "Bujin Yamato").
--Mandatory effects must be resolved before it ends, so they stay negated (e.g. Lightsworn mills).
local s,id=GetID()
function s.initial_effect(c)
	--disable
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_DISABLE)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetHintTiming(0,TIMINGS_CHECK_MONSTER|TIMING_MAIN_END)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(s.condition)
	e1:SetCost(Cost.SelfToGrave)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.condition(e,tp,eg,ep,ev,re,r,rp)
	local ph=Duel.GetCurrentPhase()
	return Duel.IsTurnPlayer(1-tp) and (Duel.IsMainPhase())
end
function s.filter(c)
	return c:IsFaceup() and not c:IsDisabled() and c:IsType(TYPE_EFFECT)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsControler(1-tp) and chkc:IsLocation(LOCATION_MZONE) and s.filter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(s.filter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
	local g=Duel.SelectTarget(tp,s.filter,tp,0,LOCATION_MZONE,1,1,nil)
	Duel.SetOperationInfo(0,CATEGORY_DISABLE,g,1,0,0)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if tc:IsFaceup() and tc:IsRelateToEffect(e) and tc:IsMonster() and not tc:IsDisabled() and tc:IsControler(1-tp) then
		Duel.NegateRelatedChain(tc,RESET_TURN_SET)
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_DISABLE)
		e1:SetReset(RESETS_STANDARD_PHASE_END)
		tc:RegisterEffect(e1)
		local e2=Effect.CreateEffect(c)
		e2:SetType(EFFECT_TYPE_SINGLE)
		e2:SetCode(EFFECT_DISABLE_EFFECT)
		e2:SetValue(RESET_TURN_SET)
		e2:SetReset(RESETS_STANDARD_PHASE_END)
		tc:RegisterEffect(e2)
		--Marks the target while it stays face-up on the field
		tc:RegisterFlagEffect(id,RESETS_STANDARD_PHASE_END,0,1)
		--At the start of the End Phase the negation ends, except for the target's mandatory effects
		local e3=Effect.CreateEffect(c)
		e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		e3:SetCode(EVENT_PHASE_START+PHASE_END)
		e3:SetCountLimit(1)
		e3:SetLabelObject(tc)
		e3:SetOperation(s.epop(e1,e2))
		e3:SetReset(RESET_PHASE|PHASE_END)
		Duel.RegisterEffect(e3,tp)
	end
end
function s.epop(e1,e2)
	return function(e,tp,eg,ep,ev,re,r,rp)
		local tc=e:GetLabelObject()
		if tc:GetFlagEffect(id)==0 then return end
		e1:Reset()
		e2:Reset()
		local e4=Effect.CreateEffect(e:GetHandler())
		e4:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		e4:SetCode(EVENT_CHAIN_SOLVING)
		e4:SetLabelObject(tc)
		e4:SetCondition(s.mandcon)
		e4:SetOperation(s.mandop)
		e4:SetReset(RESET_PHASE|PHASE_END)
		Duel.RegisterEffect(e4,tp)
	end
end
function s.mandcon(e,tp,eg,ep,ev,re,r,rp)
	local tc=e:GetLabelObject()
	return re:GetHandler()==tc and tc:GetFlagEffect(id)>0
		and re:IsHasType(EFFECT_TYPE_TRIGGER_F) and Duel.IsChainDisablable(ev)
end
function s.mandop(e,tp,eg,ep,ev,re,r,rp)
	Duel.NegateEffect(ev)
end