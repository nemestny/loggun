require 'spec_helper'

RSpec.describe ApiController, type: :controller do
  describe '#index' do
    let!(:pattern) { 'rails_modifier_enabled' }
    let!(:rails_modifier_enabled) { false }

    subject { get(:index) }

    before do
      Loggun::Config.configure do |config|
        config.pattern = pattern
        config.modifiers.rails = rails_modifier_enabled
      end
    end

    it 'does not enable modifier' do
      expect { subject }.not_to output(/#{pattern}/).to_stdout_from_any_process
    end

    context 'when modifier enabled' do
      let!(:rails_modifier_enabled) { true }

      it 'enabled modifier' do
        expect { subject }.to output(/#{pattern}/).to_stdout_from_any_process
      end
    end
  end
end