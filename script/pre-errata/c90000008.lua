--E・HERO プリズマー
--Elemental HERO Prisma (Pre-Errata)
--Edison: no cost; the Fusion Monster is revealed and the material is sent on resolution
local s,id=GetID()
function s.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_TOGRAVE)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetCountLimit(1)
	e1:SetRange(LOCATION_MZONE)
	e1:SetTarget(s.costg)
	e1:SetOperation(s.cosoperation)
	c:RegisterEffect(e1)
end
function s.filter2(c,fc)
	return c:IsCode(table.unpack(fc.material)) and c:IsAbleToGrave()
end
function s.filter1(c,tp)
	return c.material and c:IsType(TYPE_FUSION) and Duel.IsExistingMatchingCard(s.filter2,tp,LOCATION_DECK,0,1,nil,c)
end
function s.costg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.filter1,tp,LOCATION_EXTRA,0,1,nil,tp) end
	Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,nil,1,tp,LOCATION_DECK)
end
function s.cosoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	--If Prisma is no longer face-up on the field, nothing is revealed or sent
	if not c:IsRelateToEffect(e) or c:IsFacedown() then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_CONFIRM)
	local fc=Duel.SelectMatchingCard(tp,s.filter1,tp,LOCATION_EXTRA,0,1,1,nil,tp):GetFirst()
	if not fc then return end
	Duel.ConfirmCards(1-tp,fc)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local tc=Duel.SelectMatchingCard(tp,s.filter2,tp,LOCATION_DECK,0,1,1,nil,fc):GetFirst()
	if not tc then return end
	local code=tc:GetOriginalCode()
	Duel.SendtoGrave(tc,REASON_EFFECT)
	--Under "Dimensional Fissure"/"Macro Cosmos" the monster is banished, but Prisma still takes its name
	if not tc:IsLocation(LOCATION_GRAVE|LOCATION_REMOVED) then return end
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_CHANGE_CODE)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetReset(RESETS_STANDARD_PHASE_END)
	e1:SetValue(code)
	c:RegisterEffect(e1)
end
