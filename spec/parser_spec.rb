# frozen_string_literal: true

require 'spec_helper'

describe Parser do
  describe '#parse' do
    context 'with the default data (i.e. no log_path arg passed to initialize)' do
      before do
        stub_const('Parser::DEFAULT_LOG_PATH', 'spec/fixtures/default.log')
      end

      subject { described_class.new.parse }

      it 'returns a hash with array keys of the correct size' do
        expect(subject).to be_a Hash
        expect(subject['/contact/']).to be_an Array
        expect(subject['/contact/'].count).to eq 2
      end

      it 'stores each ip for each path' do
        expect(subject).to eq({
                                '/contact/' => ['39.203.28.182', '163.37.141.48'],
                                'products/1' => ['138.195.110.114', '117.198.72.249', '117.198.72.249'],
                                '/about' => ['19.47.73.203'],
                                '/products/3' => ['19.47.73.203', '245.141.61.189', '245.141.61.189'],
                                '/index' => ['19.47.73.203', '61.64.28.106', '19.47.73.203', '61.64.28.106'],
                                '/home' => ['184.99.73.243', '184.99.73.243']
                              })
      end
    end

    context 'when a log_path is passed to initialize' do
      let(:log_path) { 'spec/fixtures/alternative.log' }
      subject { described_class.new(log_path: log_path).parse }

      it 'returns an array of hashes of the correct size' do
        expect(subject).to be_a Hash
        expect(subject['/contact/']).to be_an Array
        expect(subject['/contact/'].count).to eq 1
      end

      it 'stores each ip for each path' do
        expect(subject).to eq({
                                '/products/2' => ['225.183.113.22'],
                                '/home' => ['225.183.113.22', '225.183.113.22'],
                                '/contact/' => ['245.141.61.189'],
                                '/index' => ['122.255.244.161'],
                                '/about' => ['138.222.28.220', '228.32.104.207'],
                                '/products/3' => ['138.222.28.220'],
                                'products/1' => ['117.198.72.249']
                              })
      end
    end
  end
end
