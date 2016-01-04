require_relative './spec_helper'

RSpec.describe "CPuts" do

    before do
      require_relative '../lib/cputs'
    end

    before(:each) do
        CPuts.set_preffix_and_suffix(nil)
        CPuts.set_timestamp(false)
    end

    let(:message){ 'testing cputs' }
    let(:preffix){ '-----' }
    let(:suffix){ '.....' }
    let(:custom_time_format){ '%H:%M:%S' }
    let(:default_preffix){ CPuts::Functions::Decorators.default_preffix }
    let(:default_suffix){ CPuts::Functions::Decorators.default_suffix }
    let(:default_time_format){ CPuts::Functions::Decorators.default_time_format }

    describe 'using simple cputs' do
        context 'without preffix and suffix' do
            it 'should print the exact string with line and number' do
                expect{ cputs message }.to output("#{default_preffix}#{__FILE__} at line #{__LINE__}: #{message}#{default_suffix}\n").to_stdout
            end
        end

        context 'with preffix' do

            before do
                CPuts.set_preffix(preffix)
            end

            it 'should print the exact string with preffix, line and number' do
                expect{ cputs message }.to output("#{preffix}#{__FILE__} at line #{__LINE__}: #{message}#{default_suffix}\n").to_stdout
            end

        end

        context 'with suffix' do

            before do
                CPuts.set_suffix(suffix)
            end

            it 'should print the exact string with line, number and suffix' do
                expect{ cputs message }.to output("#{default_preffix}#{__FILE__} at line #{__LINE__}: #{message}#{suffix}\n").to_stdout
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

        context 'with default timestamp' do

            before do
                CPuts.set_timestamp(true)
            end

            let(:time_stamp){Time.now.strftime(default_time_format)}

            it 'should print it' do
                expect{ cputs message }.to output("#{time_stamp} #{default_preffix}#{__FILE__} at line #{__LINE__}: #{message}#{default_suffix}\n").to_stdout
            end
        end

        context 'with custom timestamp' do

            before do
                CPuts.set_timestamp(custom_time_format)
            end

            let(:time_stamp){Time.now.strftime(custom_time_format)}

            it 'should print as format %H:%M:%S' do
                expect{ cputs message }.to output("#{time_stamp} #{default_preffix}#{__FILE__} at line #{__LINE__}: #{message}#{default_suffix}\n").to_stdout
            end
        end
    end

    describe 'using overrided puts' do

        before do
            CPuts.override_puts
        end

        context 'without preffix and suffix' do
            it 'should print the exact string with line and number' do
                expect{ puts message }.to output("#{default_preffix}#{__FILE__} at line #{__LINE__}: #{message}#{default_suffix}\n").to_stdout
            end
        end

        context 'with preffix' do

            before do
                CPuts.set_preffix(preffix)
            end

            it 'should print the exact string with preffix, line and number' do
                expect{ puts message }.to output("#{preffix}#{__FILE__} at line #{__LINE__}: #{message}#{default_suffix}\n").to_stdout
            end

        end

        context 'with suffix' do

            before do
                CPuts.set_suffix(suffix)
            end

            it 'should print the exact string with line, number and suffix' do
                expect{ puts message }.to output("#{default_preffix}#{__FILE__} at line #{__LINE__}: #{message}#{suffix}\n").to_stdout
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

        context 'with default timestamp' do

            before do
                CPuts.set_timestamp(true)
            end

            let(:time_stamp){Time.now.strftime(default_time_format)}

            it 'should print it' do
                expect{ cputs message }.to output("#{time_stamp} #{default_preffix}#{__FILE__} at line #{__LINE__}: #{message}#{default_suffix}\n").to_stdout
            end
        end

        context 'with custom timestamp' do

            before do
                CPuts.set_timestamp(custom_time_format)
            end

            let(:time_stamp){Time.now.strftime(custom_time_format)}

            it 'should print as format %H:%M:%S' do
                expect{ cputs message }.to output("#{time_stamp} #{default_preffix}#{__FILE__} at line #{__LINE__}: #{message}#{default_suffix}\n").to_stdout
            end
        end

    end

end

