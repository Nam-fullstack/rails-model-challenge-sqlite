require 'rails_helper'

RSpec.describe Film, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:film)).to be_valid
  end

  subject { build(:film) }

  context 'Database table' do
    it { expect(subject).to have_db_column(:title).of_type(:string) }
    it { expect(subject).to have_db_column(:year).of_type(:integer) }
    it { expect(subject).to have_db_column(:description).of_type(:text) }
    it { expect(subject).to have_db_column(:genre).of_type(:string) }
  end

  context 'ActiveRecord validations' do
    it { expect(subject).to validate_presence_of(:title) }
    it { expect(subject).to validate_presence_of(:genre) }

    it do 
      expect(subject).to(
        validate_length_of(:description).
        is_at_least(10).is_at_most(250))
    end

    it do
      expect(subject).to(
        validate_numericality_of(:year).
        is_greater_than_or_equal_to(1900))
    end
  end

  context 'ActiveRecord associations' do
    it { expect(subject).to belong_to(:director) }
  end

  context 'ActiveModel scopes' do
    context '.crime' do
      it 'returns all films with a genre `crime`' do
        criminal_film = create(:film, :crime)
        expect(Film.crime).to match_array([criminal_film])
      end

      it 'does not return other films with other genres' do
        other_film = create(:film)
        expect(Film.crime.count).to eq(0)
      end
    end

    context '.drama' do
      it 'returns all films with a genre `drama`' do
        drama_film = create(:film, :drama)
        expect(Film.drama).to match_array([drama_film])
      end

      it 'does not return other films with other genres' do
        other_film = create(:film)
        expect(Film.crime.count).to eq(0)
      end
    end
  end
end