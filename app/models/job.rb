class Job < Sequel::Model
  def to_message
    <<~HEREDOC
      `New job`
      *#{created_at.strftime("%B %d %H:%M:%S")}*

      `Title`
      #{title}

      `Url`
      #{url}

      `Snippet`
      #{snippet[0..120]}...
    HEREDOC
  end
end
