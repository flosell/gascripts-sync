class ScriptProject 
  def initialize(hash)
    @data = hash
  end

  def id_from_name(filename) 
    found = @data["files"].select {|file| "#{file['name']}.#{file['type']}"==filename }
    if (found.empty?)
      nil
    else     
      found.first['id']
    end
  end
end