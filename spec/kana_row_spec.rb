RSpec.describe KanaRow do
  it "has a version number" do
    expect(KanaRow::VERSION).not_to be nil
  end

  describe 'String#kana_row' do
    context 'without arguments' do
      it "returns kana's row" do
        expect('アイウエオァィゥェォ'.split('').sample.kana_row).to eq 'ア'
        expect('カキクケコ'.split('').sample.kana_row).to eq 'カ'
        expect('サシスセソ'.split('').sample.kana_row).to eq 'サ'
        expect('タチツテト'.split('').sample.kana_row).to eq 'タ'
        expect('ナニヌネノ'.split('').sample.kana_row).to eq 'ナ'
        expect('ハヒフヘホ'.split('').sample.kana_row).to eq 'ハ'
        expect('マミムメモ'.split('').sample.kana_row).to eq 'マ'
        expect('ヤユヨャュョ'.split('').sample.kana_row).to eq 'ヤ'
        expect('ラリルレロ'.split('').sample.kana_row).to eq 'ラ'
        expect('ワヰヱヲ'.split('').sample.kana_row).to eq 'ワ'
        expect('ガギグゲゴ'.split('').sample.kana_row).to eq 'カ'
        expect('ザジズゼゾ'.split('').sample.kana_row).to eq 'サ'
        expect('ダヂヅデド'.split('').sample.kana_row).to eq 'タ'
        expect('バビブベボ'.split('').sample.kana_row).to eq 'ハ'
        expect('パピプペポ'.split('').sample.kana_row).to eq 'ハ'
        expect('ヴ'.split('').sample.kana_row).to eq 'ア'
        expect('ン'.split('').sample.kana_row).to eq 'ワ'
      end
    end

    context 'with marked_to_plain: false' do
      it "returns kana's row" do
        expect('ガギグゲゴ'.split('').sample.kana_row(marked_to_plain: false)).to eq 'ガ'
        expect('ザジズゼゾ'.split('').sample.kana_row(marked_to_plain: false)).to eq 'ザ'
        expect('ダヂヅデド'.split('').sample.kana_row(marked_to_plain: false)).to eq 'ダ'
        expect('バビブベボ'.split('').sample.kana_row(marked_to_plain: false)).to eq 'バ'
        expect('パピプペポ'.split('').sample.kana_row(marked_to_plain: false)).to eq 'パ'
      end
    end

    context 'with include_special: false' do
      it "returns kana's row" do
        expect('ヴ'.split('').sample.kana_row(include_special: false)).to be_nil
        expect('ン'.split('').sample.kana_row(include_special: false)).to be_nil
      end
    end

    context 'with hiragana' do
      it "returns kana's row" do
        expect(('ぁ'..'ん').to_a.sample.kana_row).to be_included_in('あかさたなはまやらわ'.split(''))
      end
    end

    context 'with hankaku kana' do
      it "returns kana's row" do
        expect(('ｧ'..'ﾝ').to_a.sample.kana_row).to be_included_in('アカサタナハマヤラワ'.split(''))
      end
    end

    context 'without kana' do
      it "returns nil" do
        expect(%w(漢 A Ｂ 1 ２ 😁).sample.kana_row).to be_nil
      end
    end
  end


end
