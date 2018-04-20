include Math


class User
    attr_accessor(:level, :currentXp, :nextLevel, :attendanceStreak, :achievements)
    def initialize(id, name, department)
        @level = 1
        @currentXp = 0
        @nextLevel = 50
        @attendanceStreak = 0
        @id = id
        @name = name
        @department = department
        @achievements = []
    end

    def giveXp(x)
        @currentXp += x
        if @currentXp >= @nextLevel
            @level += 1
            @nextlevel = @nextLevel * (1+log2(level))
        end
    end
    
    def endStreak(x)
        @attendanceStreak = 0
    end
    
    def incrementStreak
        @attendanceStreak += 1
    end
end

class Achievement
    attr_accessor(:name, :xp)
    def initialize(name, xp)
        @xp = xp
        @name = name
    end
    
    def giveAchievement(user)
        user.achievements.push(@name)
        user.giveXp(@xp)
    end
end

#Test Space

instance = User.new(17, 'Tom','Back Area')
george = User.new(18,'Steve', 'Dev Team')
puts instance.level
instance.giveXp(50)

shiftHero = Achievement.new('Shift Hero', 100)
shiftHero.giveAchievement(instance)
shiftHero.giveAchievement(george)
puts instance.level
puts instance.achievements
puts george.level
puts george.achievements
