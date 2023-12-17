local creatures = {
  {
    name = "Creep", hp = 500, energy = 20, attack = 27, defense = 24,
    description = "Uma criatura nada misteriosa criada a partir de um desafio lua",
    voice = "Creeeeep!!!",
  },
  {
    name = "Skull", hp = 500, energy = 20, attack = 31, defense = 15,
    description = "Um esqueleto revivido para um desafio lua",
    voice = "Cruuuq!!!",
  },
  {
    name = "Skull", hp = 500, energy = 20, attack = 31, defense = 15,
    description = "Um esqueleto revivido para um desafio lua",
    voice = "Cruuuq!!!",
  },
  -- Adicione outras criaturas aqui
}

local function isAlive(creature)
  return creature.hp > 0
end

local function attackOther(attacker, defender)
  local damage = math.max(attacker.attack - defender.defense, 0)
  defender.hp = defender.hp - damage
  return damage
end

local function battle(creatures)
  while #creatures > 1 do
    local attackerIndex = math.random(#creatures)
    local defenderIndex = math.random(#creatures)

    -- Evitar que a criatura ataque a si mesma
    if attackerIndex == defenderIndex then
      defenderIndex = defenderIndex % #creatures + 1
    end

    local attacker = creatures[attackerIndex]
    local defender = creatures[defenderIndex]

    local damage = attackOther(attacker, defender)
    print(attacker.name, "attacks", defender.name, "causing", damage, "damage.")

    if not isAlive(defender) then
      print(defender.name, "is defeated!")
      table.remove(creatures, defenderIndex)
	  if #creatures == 1 then break end
    end
  end

  local winner = creatures[1]
  print("Battle Over: Winner is", winner.name)
end

-- Inicializando o gerador de números aleatórios
math.randomseed(os.time())

-- Simulando a batalha
battle(creatures)

--[[ Output

Creep   attacks Skull   causing 12      damage.
Skull   attacks Creep   causing 7       damage.
Skull   attacks Creep   causing 7       damage.
Creep   attacks Skull   causing 12      damage.
Creep   attacks Skull   causing 12      damage.
Skull   attacks Creep   causing 7       damage.
Creep   attacks Skull   causing 12      damage.
Skull   attacks Creep   causing 7       damage.
Skull   attacks Creep   causing 7       damage.
Skull   attacks Creep   causing 7       damage.
Skull   attacks Creep   causing 7       damage.
Creep   attacks Skull   causing 12      damage.
Skull   attacks Creep   causing 7       damage.
Creep   attacks Skull   causing 12      damage.
Skull   attacks Creep   causing 7       damage.
Creep   attacks Skull   causing 12      damage.
Creep   attacks Skull   causing 12      damage.
Skull   is defeated!
Battle Over: Winner is  Creep

--]]

-- Para usar o script, basta executar o lua54.exe, e dofile('main.lua')