

class ScriptProject 
  def initialize(hash)
    @data = hash
    @files = @data["files"].map { |file| ProjectFile.from_hash(file)}
  end

  def id_from_name(filename) 
    found = @files.select {|file| file.filename==filename }
    if (found.empty?)
      nil
    else     
      found[0].id
    end
  end

  def files 
    @files
  end
end