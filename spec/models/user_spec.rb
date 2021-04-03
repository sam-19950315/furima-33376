require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "ユーザーが登録できる時" do
      it 'nicknameとemailとpassword(6文字以上)とpassword_confirmation(passwordと一致)lasta_nameとfirst_nameとlast_name_katakanaとfirst_name_katakanaとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context "ユーザーが登録できない時" do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_katakanaが空では登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が存在しない場合登録できない' do
        @user.email = Faker::Alphanumeric.alphanumeric(number: 10)
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字だと登録できない' do
        @user.password = Faker::Alphanumeric.alphanumeric(number: 5)
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字だけだと登録できない' do
        @user.password = Faker::Alphanumeric.alpha(number: 6)
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = Faker::Number.number(digits: 6)
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが一致していない場合登録できない' do
        @user.password_confirmation = Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 3, min_numeric: 3)
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない' do
        @user.first_name = Faker::Alphanumeric.alphanumeric(number: 5)
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角ひらがな、全角カタカナ、全角漢字で記入してください')
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない' do
        @user.last_name = Faker::Alphanumeric.alphanumeric(number: 5)
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角ひらがな、全角カタカナ、全角漢字で記入してください')
      end
      it 'first_name_katakanaが全角（カタカナ）以外の場合登録できない' do
        @user.first_name_katakana = Faker::Alphanumeric.alphanumeric(number: 5)
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana 全角カタカナで記入してください')
      end
      it 'last_name_katakanaが全角（カタカナ）以外の場合登録できない' do
        @user.last_name_katakana = Faker::Alphanumeric.alphanumeric(number: 5)
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana 全角カタカナで記入してください')
      end
    end
  end
end
