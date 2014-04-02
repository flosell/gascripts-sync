

class ScriptProject 
  def self.from_hash(hash)
    files = hash["files"].map { |file| ProjectFile.from_hash(file)}
    ScriptProject.new(files)
  end

  def initialize(files)
    @files = files
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