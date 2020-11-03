class ChoiceCollection
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  CHOICE_NUM = 4  # 同時にユーザーを作成する数
  attr_accessor :collection  # ここに作成したユーザーモデルが格納される

  # 初期化メソッド
  def initialize(attributes = [])
    if attributes.present?
      self.collection = attributes.map do |value|
        Choice.new(
          name: value['name'],
          address: value['address'],
          age: value['age']
        )
      end
    else
      self.collection = CHOICE_NUM.times.map{ Choice.new }
    end
  end