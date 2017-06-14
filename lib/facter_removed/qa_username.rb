Facter.add(:qa_username) do
  setcode do
    begin
      /\((.*?)\)/.match(Facter.value(:sp_user_name)).captures[0]
    rescue
      nil
    end
  end
end
