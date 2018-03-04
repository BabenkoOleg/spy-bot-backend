class Observation < Sequel::Model
  def to_filter
    values.select { |k, v| k != :id && !v.nil? }
          .merge({ paging: '0;100'})
  end
end
