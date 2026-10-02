Config = {}

-- General Settings
Config.Locale = 'en'
Config.StartingCash = 5000

-- Combat Settings
Config.CombatCooldown = 5000 -- in milliseconds
Config.BlockStaminaCost = 10
Config.DodgeStaminaCost = 15
Config.PunchDamage = 5
Config.HeavyAttackDamage = 15

-- Progression Settings
Config.XPPerFight = 10
Config.SkillPointsPerLevel = 1
Config.MaxLevel = 100

-- Rank Settings
Config.Ranks = {
    {name = 'Novice', xp = 0},
    {name = 'Apprentice', xp = 100},
    {name = 'Expert', xp = 500},
    {name = 'Master', xp = 1000},
    {name = 'Legend', xp = 2000}
}

-- Admin Panel Settings
Config.AdminPanel = {
    enabled = true,
    command = 'adminpanel'
}