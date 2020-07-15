# frozen_string_literal: true

require 'spec_helper'

describe Parser do
  describe '#parse' do
    context 'with the default data (i.e. no log_path arg passed to initialize)' do
      before do
        stub_const('Parser::DEFAULT_LOG_PATH', 'spec/fixtures/default.log')
      end

      subject { described_class.new.parse }

      it 'returns a collection of hashes with url and ip keys' do
        expect(subject[0]).to have_key(:ip)
        expect(subject[0]).to have_key(:url)
      end

      it 'returns an array of hashes of the correct size' do
        expect(subject).to be_an Array
        expect(subject[0]).to be_a Hash

        expect(subject.size).to eq 15
      end

      it 'separates the log data into url and ip correctly' do
        expect(subject[0][:url]).to eq 'contact'
        expect(subject[0][:ip]).to eq '39.203.28.182'
      end
    end

    context 'when a log_path is passed to initialize' do
      let(:log_path) { 'spec/fixtures/alternative.log' }
      subject { described_class.new(log_path: log_path).parse }

      it 'returns an array of hashes of the correct size' do
        expect(subject).to be_an Array
        expect(subject[0]).to be_a Hash

        expect(subject.size).to eq 10
      end

      it 'separates the log data into url and ip correctly' do
        expect(subject[0][:url]).to eq 'products/2'
        expect(subject[0][:ip]).to eq '225.183.113.22'
      end
    end
  end
end
