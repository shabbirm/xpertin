# Holds a hash of key and values and provides accessor methods to access the keys in the hash. 
# This is useful for creating search forms
class DynaBean
  @fields = nil
  @errors = nil

  def initialize(fields)
    @errors = ActiveRecord::Errors.new(self)
    return if fields === nil
    @fields = Hash.new
    fields.each_pair do |key, val|
      if val == nil
        @fields[key] = ''
      else
        @fields[key] = val
      end
    end
  end

  def validate(field_names)
    field_names.each do |field_name|
      if ! @fields[field_name] || @fields[field_name] == ''
        @errors.add(field_name, ' cannot be blank')
      end
    end
    return @errors.empty?
  end

  def errors
    @errors
  end

  def fields
    @fields
  end

  def DynaBean.human_attribute_name(attribute)
    Inflector.humanize(attribute)
  end

  # fallback for allowing method accessors for keys in fields
  def method_missing(method_id)
    field_name = method_id.to_s
    if @fields != nil && @fields[field_name] != nil
      return @fields[field_name]
    end
      return ''
    else
  end
end
