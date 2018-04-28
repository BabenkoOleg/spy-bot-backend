class Job < Sequel::Model
  def to_message
    <<~HEREDOC
    *```#{title}```*

      *Date:* `#{created_at.strftime("%B %d %H:%M:%S")}`

      *Skills:* #{slills.any? ? `#{skills}` : ''}

      *Category:* `#{category}`

      *Snippet:*\n#{snippet.split("\n").map { |line| "> #{line}" }.join("\n")}
    HEREDOC
  end
end
