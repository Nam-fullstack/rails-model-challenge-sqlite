require 'rails_helper'

RSpec.describe Director, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:director)).to be_valid
  end

  subject { build(:director) }

  context 'Database table' do
    it { expect(subject).to have_db_column(:name).of_type(:string) }
    it { expect(subject).to have_db_column(:country).of_type(:string) }
    it { expect(subject).to have_db_column(:active).of_type(:boolean) }
  end

  context 'ActiveRecord validations' do
    it { expect(subject).to validate_presence_of(:country) }

    it do 
      expect(subject).to(
        validate_length_of(:name).
        is_at_least(2).is_at_most(50))
    end
  end

  context 'ActiveRecord associations' do
    it { expect(subject).to have_many(:films) }
  end

  context 'ActiveModel scopes' do
    context '.active' do
      it 'returns all active directors' do
        active_director = create(:director)
        expect(Director.active).to match_array([active_director])
      end

      it 'does not return inactive directors' do
        inactive_director = build(:director, :inactive)
        expect(Director.active.count).to eq(0)
      end
    end
  end
end