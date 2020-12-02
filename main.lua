local CovenantMissionFrame = CovenantMissionFrame

local MissionPage = CovenantMissionFrame.MissionTab.MissionPage
local Stage = MissionPage.Stage
local Board = MissionPage.Board
local StartMissionButton = MissionPage.StartMissionButton

local function strToNum(str)
    if str == nil or s == '' then return 0 end
    local chrs = ","
    local s = str:gsub("["..chrs:gsub("%W","%%%1").."]", '')
    local n = tonumber(s)
    return n
end

local function CalculateSuccess()
    if not MissionPage:IsVisible() then return end
    local EnemyPowerValue = strToNum(Stage.EnemyPowerValue:GetText())
    local EnemyHealthValue = strToNum(Stage.EnemyHealthValue:GetText())
    local AllyPowerValue = strToNum(Board.AllyPowerValue:GetText())
    local AllyHealthValue = strToNum(Board.AllyHealthValue:GetText())
    
    local val1 = EnemyHealthValue / AllyPowerValue
    local val2 = AllyHealthValue / EnemyPowerValue

    -- print(EnemyPowerValue, EnemyHealthValue, AllyPowerValue, AllyHealthValue)
    -- print(val1 / val2)

    if val1 < val2 then
        StartMissionButton:SetFormattedText("|cff00ff00%s|r", "Start");
    else
        StartMissionButton:SetFormattedText("|cffff0000%s|r", "Start");
    end
end

hooksecurefunc(CovenantMissionFrame, "UpdateAllyPower", CalculateSuccess)
hooksecurefunc(CovenantMissionFrame, "UpdateEnemyPower", CalculateSuccess)