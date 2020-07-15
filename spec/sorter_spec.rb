# frozen_string_literal: true

require 'spec_helper'

describe Sorter do
  subject { described_class.new(log_data: log_data, sort_klass: sort_klass) }

  let(:sort_klass) { SortTypes::ByPageViews }
  let(:log_data) do
    { 
      '/home' => ['245.141.61.189'],
      '/faqs' => ['245.141.61.189', '245.141.61.199']
    }
  end

  describe '#sort' do
    it 'sorts the log_data by the given metric' do
      expect(subject.sort).to eq(
        [
          ['/faqs', ['245.141.61.189', '245.141.61.199']],
          ['/home', ['245.141.61.189']]
        ]
      )
    end

    context 'when the sort_klass does not define .sort_by' do
      let(:sort_klass) { Class }

      it 'sorts the log_data by the given metric' do
        expect { subject.sort }.to raise_error(Sorter::InvalidSortClassError)
      end
    end
  end
end
