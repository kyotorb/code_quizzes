require 'spec_helper'
require 'codebreaker'

module Codebreaker
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:game) { Game.new(output) }

    describe "#start" do
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreaker!')
        game.start('1234')
      end

      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess: ')
        game.start('1234')
      end
    end

    describe "#guess" do
      context "with no matches" do
        it "sends a mark with ''" do
          game.start('1234')
          game.guess('5555').should == ''
        end
      end

      context "with 1 number match" do
        it "sends a mark with '-'" do
          game.start('1234')
          game.guess('2555').should == '-'
        end
      end

      context "with 1 exact match" do
        it "sends a mark with '+'" do
          game.start('1234')
          game.guess('1555').should == '+'
        end
      end

      context "with 2 number matches" do
        it "sends a mark with '--'" do
          game.start('1234')
          game.guess('2355').should == '--'
        end
      end

      context "with 1 number match and 1 exact match (in that order)" do
        it "sends a mark with '+-'" do
          game.start('1234')
          game.guess('2535').should == '+-'
        end
      end

      context "with 1 exact match duplicated in guess" do
        it "sends a mark with '+'" do
          game.start('1234')
          game.guess('1155').should == '+'
        end
      end

      context "with 1 exact match duplicated in secret" do
        it "sends a mark with '+'" do
          game.start('1155')
          game.guess('1234').should == '+'
        end
      end

      context "with 1 number match duplicated in secret" do
        it "sends a mark with '-'" do
          game.start('1511')
          game.guess('2134').should == '-'
        end
      end
    end
  end
end
