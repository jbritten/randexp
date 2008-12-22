class RandCity
  def self.load_cities
    dir = File.dirname(__FILE__)
    if File.exists?("#{dir}/../../../wordlists/cities")
      File.read("#{dir}/../../../wordlists/cities").split("\n")
    else
      raise "words file not found"
    end
  end

  def self.cities(options = {})
    if options.has_key?(:length)
      cities_by_length[options[:length]]
    else
      @@cities ||= load_cities
    end
  end

  def self.cities_by_length
    @@cities_by_length ||= cities.inject({}) {|h, w| (h[w.size] ||= []) << w; h }
  end
end