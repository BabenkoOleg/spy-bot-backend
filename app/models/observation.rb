class Observation < Sequel::Model
  def to_filter
    values.select { |k, v| k != :id && !v.nil? }
  end
end
