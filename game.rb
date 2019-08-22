class Scene
  def enter()
  end
end


class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene("Finished!")

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    current_scene.enter()
  end
end

class Death < Scene
  @@quips = [
    "You died.  You kinda suck at this.",
    "Your mom would be proud...if she were smarter.",
    "Such a luser.",
    "I have a small puppy that's better at this."
  ]
  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

class CentralCorridor < Scene

  def enter()
    puts "Get away from this hell!"
    
    action = $stdin.gets.chomp

    if action == "shoot!"
      puts "You are dead.  Then he eats you."
      return 'death'

      elsif action == "dodge!"
        puts "Gothon stomps on your head and eats you."
        return 'death'

      elsif action == "tell a joke"
        puts "You tell the one Gothon joke"
        return 'laser_weapon_armory'

      else
        puts "DOES NOT COMPUTE!"
        return 'central_corridor'
    end
  end
end

class LaserWeaponArmory < Scene

  def enter()
    puts "Get the bomb.  The code is 3 digits."
    code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    print "[keypad]> "
    guess = $stdin.gets.chomp
    guesses = 0

    while guess != code && guesses < 10
      puts "BZZZZEDDD!"
      guesses += 1
      print "[keypad]> "
      guess = $stdin.gets.chomp
    end
    if guess == code
        puts "Grab the bomb and get to the bridge"
        return 'the_bridge'
    else
      puts "TThe ship explode!!"
      return 'death'
    end
  end
end

class TheBridge < Scene

  def enter()
    puts "You burst onto the Bridge with the netron destruct bomb"

    action = $stdin.gets.chomp

    if action == "throw the bomb"
      puts "In a panic you throw the bomb"
      return 'death'

    elsif action == "slowly place the bomb"
      puts " And get off this tin can."
      return 'escape_pod'
    else
      puts "DOES NOT COMPUTE!"
      return "the_bridge"
    end
  end
end

class EscapePod < Scene

  def enter()
    puts "There's 5 pods, which one do you take?"

    good_pod = rand(1..5)
    print "[pod #]> "
    guess = $stdin.gets.chomp.to_i


    if guess != good_pod
      puts "You jump into pod %s and hit the eject button." % guess
      return 'death'
    else      
      puts "You won!"
      return 'finished'
    end
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job."
  end
end


class Map

  @@scenes = {
    'central_corridor' => CentralCorridor.new(),
    'laser_weapon_armory' => LaserWeaponArmory.new(),
    'the_bridge' => TheBridge.new(),
    'escape_pod' => EscapePod.new(),
    'death' => Death.new(),
    'finished' => Finished.new(),
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end


a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()