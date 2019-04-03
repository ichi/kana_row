require 'kana_row/version'
require 'mojinizer'

module KanaRow
  KANAS_MAP = {
    'ア' => 'アイウエオァィゥェォ',
    'カ' => 'カキクケコ',
    'サ' => 'サシスセソ',
    'タ' => 'タチツテト',
    'ナ' => 'ナニヌネノ',
    'ハ' => 'ハヒフヘホ',
    'マ' => 'マミムメモ',
    'ヤ' => 'ヤユヨャュョ',
    'ラ' => 'ラリルレロ',
    'ワ' => 'ワヰヱヲ',
    'ガ' => 'ガギグゲゴ',
    'ザ' => 'ザジズゼゾ',
    'ダ' => 'ダヂヅデド',
    'バ' => 'バビブベボ',
    'パ' => 'パピプペポ',
  }.transform_values{|v| v.split('') }.freeze

  SPECIAL_KANAS_MAP = {
    'ア' => 'ヴ',
    'ワ' => 'ン',
  }.transform_values{|v| v.split('') }.freeze

  MARKED_KANA_ROWS = {
    'ガ' => 'カ',
    'ザ' => 'サ',
    'ダ' => 'タ',
    'バ' => 'ハ',
    'パ' => 'ハ',
  }.freeze

  def kana_row(marked_to_plain: true, include_special: true)
    kana = self.chr.han_to_zen
    return unless kana.kana?

    if is_hiragana = kana.hiragana?
      kana = kana.katakana
    end

    row = kanas_map(include_special: include_special).find{|_, v| v.include?(kana) }&.first
    row = MARKED_KANA_ROWS.fetch(row, row) if marked_to_plain
    row = row&.hiragana if is_hiragana

    row
  end

  private

  def kanas_map(include_special: true)
    special = include_special || {}
    special = SPECIAL_KANAS_MAP unless special.is_a? Hash

    KANAS_MAP.merge(special) do |key, this_val, other_val|
      other_val =
        case other_val
        when String then other_val.split('')
        when Array then other_val
        else []
        end
      this_val + other_val
    end
  end

end

class String
  include KanaRow
end
