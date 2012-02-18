require 'spec_helper'

describe UserLogin do
  describe 'messages' do
    it 'should contain a description' do
      matcher = have_foreign_key_for(:users, :dependent => :nullify)
      matcher.description.should == 'have a foreign key for users with {:dependent=>:nullify}'
    end

    it 'should set failure_message_for_should message' do
      stub_fkd_to_s_with('expected fk')
      matcher = have_foreign_key_for(:user_logins)
      matcher.matches?(subject)
      matcher.failure_message_for_should.should == "expected #{subject.connection.foreign_keys('user_logins')} to include expected fk"
    end

    it 'should set failure_message_for_should_not message' do
      stub_fkd_to_s_with('unexpected fk')
      matcher = have_foreign_key_for(:users, :dependent => :nullify)
      matcher.matches?(subject)
      matcher.failure_message_for_should_not.should == "expected #{subject.connection.foreign_keys('user_logins')} to exclude unexpected fk"
    end
  end

  describe 'matcher' do
    it { should have_foreign_key_for(:user, :dependent => :nullify) }
    it { should have_foreign_key_for(:users, :dependent => :nullify) }
  end
end
