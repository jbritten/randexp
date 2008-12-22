class RandState
  def self.load_states
    dir = File.dirname(__FILE__)
    if File.exists?("#{dir}/../../../wordlists/states")
      File.read("#{dir}/../../../wordlists/states").split("\n")
    else
      raise "words file not found"
    end
  end

  def self.states(options = {})
    if options.has_key?(:length)
      states_by_length[options[:length]]
    else
      @@states ||= load_states
    end
  end

  def self.states_by_length
    @@states_by_length ||= states.inject({}) {|h, w| (h[w.size] ||= []) << w; h }
  end
end