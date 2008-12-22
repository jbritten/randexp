class RandCountry
  def self.load_countries
    dir = File.dirname(__FILE__)
    if File.exists?("#{dir}/../../../wordlists/countries")
      File.read("#{dir}/../../../wordlists/countries").split("\n")
    else
      raise "words file not found"
    end
  end

  def self.countries(options = {})
    if options.has_key?(:length)
      countries_by_length[options[:length]]
    else
      @@countries ||= load_countries
    end
  end

  def self.countries_by_length
    @@countries_by_length ||= countries.inject({}) {|h, w| (h[w.size] ||= []) << w; h }
  end
end