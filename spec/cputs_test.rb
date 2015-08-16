require_relative './spec_helper'

RSpec.describe "CPuts" do

    before do
      require_relative '../lib/cputs'
    end

    before(:each) do
        CPuts.set_preffix_and_suffix(nil)
    end

    let(:message){'testing cputs'}
    let(:preffix){'-----'}
    let(:suffix){'.....'}

    describe 'using simple cputs' do
        context 'without preffix and suffix' do
            it 'should print the exact string with line and number' do
                expect{ cputs message }.to output("#{__FILE__} at line #{__LINE__}: #{message}\n").to_stdout
            end
        end

        context 'with preffix' do

            before do
                CPuts.set_preffix(preffix)
            end

            it 'should print the exact string with preffix, line and number' do
                expect{ cputs message }.to output("#{preffix}#{__FILE__} at line #{__LINE__}: #{message}\n").to_stdout
            end

        end

        context 'with suffix' do

            before do
                CPuts.set_suffix(suffix)
            end

            it 'should print the exact string with line, number and suffix' do
                expect{ cputs message }.to output("#{__FILE__} at line #{__LINE__}: #{message}#{suffix}\n").to_stdout
            end

        end

        context 'with preffix and suffix (separated_method)' do

            before do
                CPuts.set_preffix(preffix)
                CPuts.set_suffix(suffix)
            end

            it 'should print the exact string with preffix, line, number and suffix' do
                expect{ cputs message }.to output("#{preffix}#{__FILE__} at line #{__LINE__}: #{message}#{suffix}\n").to_stdout
            end

        end

        context 'with preffix and suffix method' do

            before do
                CPuts.set_preffix_and_suffix(preffix, suffix)
            end

            it 'should print the exact string with preffix, line, number and suffix' do
                expect{ cputs message }.to output("#{preffix}#{__FILE__} at line #{__LINE__}: #{message}#{suffix}\n").to_stdout
            end

        end
    end

    describe 'using overrided puts' do

        before do
            CPuts.override_puts
        end

        context 'without preffix and suffix' do
            it 'should print the exact string with line and number' do
                expect{ puts message }.to output("#{__FILE__} at line #{__LINE__}: #{message}\n").to_stdout
            end
        end

        context 'with preffix' do

            before do
                CPuts.set_preffix(preffix)
            end

            it 'should print the exact string with preffix, line and number' do
                expect{ puts message }.to output("#{preffix}#{__FILE__} at line #{__LINE__}: #{message}\n").to_stdout
            end

        end

        context 'with suffix' do

            before do
                CPuts.set_suffix(suffix)
            end

            it 'should print the exact string with line, number and suffix' do
                expect{ puts message }.to output("#{__FILE__} at line #{__LINE__}: #{message}#{suffix}\n").to_stdout
            end

        end

        context 'with preffix and suffix (separated_method)' do

            before do
                CPuts.set_preffix(preffix)
                CPuts.set_suffix(suffix)
            end

            it 'should print the exact string with preffix, line, number and suffix' do
                expect{ puts message }.to output("#{preffix}#{__FILE__} at line #{__LINE__}: #{message}#{suffix}\n").to_stdout
            end

        end

        context 'with preffix and suffix method' do

            before do
                CPuts.set_preffix_and_suffix(preffix, suffix)
            end

            it 'should print the exact string with preffix, line, number and suffix' do
                expect{ puts message }.to output("#{preffix}#{__FILE__} at line #{__LINE__}: #{message}#{suffix}\n").to_stdout
            end

        end
    end

end

