require 'rails_helper'

RSpec.describe Goaling, type: :model do
  describe Goaling do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:user_id)}
  end

  describe Goaling do
    describe "associations" do
      it {should belong_to(:user)}
    end
  end

  describe Goaling do
    describe "private_public" do
      it {should validate_inclusion_of(:private_public).
      in_array(['private','public'])}
    end
  end



end
