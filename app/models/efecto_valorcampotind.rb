# encoding: UTF-8

class EfectoValorcampotind < ActiveRecord::Base
  belongs_to :efecto, class_name: 'Cor1440Gen::Efecto',
    foreign_key: 'efecto_id'

  belongs_to :valorcampotind, 
    class_name: 'Cor1440Gen::Valorcampotind', 
    foreign_key: 'valorcampotind_id', validate: true
  accepts_nested_attributes_for :valorcampotind, 
    reject_if: :all_blank 
  
  validates :efecto, presence: true
  #validates :valorcampotind, presence: true
end

