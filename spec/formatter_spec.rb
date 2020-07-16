# frozen_string_literal: true

require 'spec_helper'

describe Formatter do
  let(:log_data) do
    {
      '/home' => ['245.141.61.189'],
      '/faqs' => ['245.141.61.189', '245.141.61.199']
    }
  end

  subject { described_class.new(log_data: log_data, sort_klass: SortTypes::ByPageViews) }

  describe '#present' do
    let(:expected) { "Page views by total views (desc order): \n/faqs 2 visits \n/home 1 visits \n" }

    it 'returns correctly formatted text' do
      expect { subject.format }.to output(expected).to_stdout
    end
  end
end
