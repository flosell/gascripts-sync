class ProjectFile

  def self.from_hash(hash) 
    ProjectFile.new(hash['id'],hash['name'],hash['type'],hash['source'])
  end
  
  def initialize(id,name,type,source)
    @id = id
    @name = name
    @type = type
    @source = source
  end

  def type
    @type
  end

  def name 
    @name
  end

  def id
    @id
  end

  def source
    @source
  end

  def filename
    "#{@name}.#{@type}"
  end

  def to_hash 
    hash = {}
    instance_variables.each {|var| val = instance_variable_get(var);hash[var.to_s.delete("@")] = val unless val == :nil}

    hash
  end
end