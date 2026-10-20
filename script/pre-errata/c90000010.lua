--王家の眠る谷－ネクロバレー
--Necrovalley (Edison Pre-Errata)
--Edison text: negate the effects of Spells, Traps and Effect Monsters that TARGET a card(s) in either GY.
--Effects that move cards from the GY without targeting (Rekindling, Drill Warrior, Treeborn Frog...) are not negated.
--Exceptions negated even without targeting (edisonformat.net): Question, Fiber Jar, Penguin Knight, Agido.
local s,id=GetID()
local NON_TARGET_EXCEPTIONS={38723936,78706415,36039163,16135253}
function s.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e1)
	--Increase ATK/DEF
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_UPDATE_ATTACK)
	e2:SetRange(LOCATION_FZONE)
	e2:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
	e2:SetTarget(aux.TargetBoolFunction(Card.IsSetCard,SET_GRAVEKEEPERS))
	e2:SetValue(500)
	c:RegisterEffect(e2)
	local e3=e2:Clone()
	e3:SetCode(EFFECT_UPDATE_DEFENSE)
	c:RegisterEffect(e3)
	--Cards in the GY cannot be removed from play
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_FIELD)
	e4:SetCode(EFFECT_CANNOT_REMOVE)
	e4:SetRange(LOCATION_FZONE)
	e4:SetTargetRange(LOCATION_GRAVE,0)
	e4:SetCondition(s.contp)
	c:RegisterEffect(e4)
	local e5=e4:Clone()
	e5:SetTargetRange(0,LOCATION_GRAVE)
	e5:SetCondition(s.conntp)
	c:RegisterEffect(e5)
	--Negate effects that target a card in the GY when they resolve
	--(no EFFECT_NECRO_VALLEY on the GY cards: non-targeting effects must keep working)
	local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e6:SetCode(EVENT_CHAIN_SOLVING)
	e6:SetRange(LOCATION_FZONE)
	e6:SetOperation(s.disop)
	c:RegisterEffect(e6)
end
s.listed_series={SET_GRAVEKEEPERS}
function s.contp(e)
	return not Duel.IsPlayerAffectedByEffect(e:GetHandler():GetControler(),EFFECT_NECRO_VALLEY_IM)
end
function s.conntp(e)
	return not Duel.IsPlayerAffectedByEffect(1-e:GetHandler():GetControler(),EFFECT_NECRO_VALLEY_IM)
end
function s.gyfilter(c,not_im)
	return c:IsLocation(LOCATION_GRAVE) and not_im[c:GetControler()]
end
function s.disop(e,tp,eg,ep,ev,re,r,rp)
	local rc=re:GetHandler()
	if not Duel.IsChainDisablable(ev) or rc:IsHasEffect(EFFECT_NECRO_VALLEY_IM) then return end
	local not_im={[0]=not Duel.IsPlayerAffectedByEffect(0,EFFECT_NECRO_VALLEY_IM),
		[1]=not Duel.IsPlayerAffectedByEffect(1,EFFECT_NECRO_VALLEY_IM)}
	local negate=false
	if re:IsHasProperty(EFFECT_FLAG_CARD_TARGET) then
		local tg=Duel.GetChainInfo(ev,CHAININFO_TARGET_CARDS)
		negate=tg and tg:IsExists(s.gyfilter,1,nil,not_im)
	end
	if not negate and rc:IsCode(table.unpack(NON_TARGET_EXCEPTIONS)) then
		negate=not_im[0] or not_im[1]
	end
	if negate then Duel.NegateEffect(ev) end
end
