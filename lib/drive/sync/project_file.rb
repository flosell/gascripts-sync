class ProjectFile
  def initialize(hash) 
    @hash = hash
  end

  def type
    @hash['type']
  end

  def name 
    @hash['name']
  end

  def id
    @hash['id']
  end

  def source
    @hash['source']
  end

  def filename
    "#{name}.#{type}"
  end
end