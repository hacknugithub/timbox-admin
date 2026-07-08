module Stetable
  extend ActiveSupport::Concern

  # Maps the standard abbreviations to integers for the database
  STATE_CODES = {
    CDMX: 0,  # Ciudad de México
    AGS:  1,  # Aguascalientes
    BC:   2,  # Baja California
    BCS:  3,  # Baja California Sur
    CAMP: 4,  # Campeche
    COAH: 5,  # Coahuila
    COL:  6,  # Colima
    CHIS: 7,  # Chiapas
    CHIH: 8,  # Chihuahua
    DGO:  9,  # Durango
    GTO:  10, # Guanajuato
    GRO:  11, # Guerrero
    HGO:  12, # Hidalgo
    JAL:  13, # Jalisco
    MEX:  14, # Estado de México
    MICH: 15, # Michoacán
    MOR:  16, # Morelos
    NAY:  17, # Nayarit
    NL:   18, # Nuevo León
    OAX:  19, # Oaxaca
    PUE:  20, # Puebla
    QRO:  21, # Querétaro
    QROO: 22, # Quintana Roo
    SLP:  23, # San Luis Potosí
    SIN:  24, # Sinaloa
    SON:  25, # Sonora
    TAB:  26, # Tabasco
    TAMP: 27, # Tamaulipas
    TLAX: 28, # Tlaxcala
    VER:  29, # Veracruz
    YUC:  30, # Yucatán
    ZAC:  31  # Zacatecas
  }.freeze

  # Maps the abbreviation back to the full display name
  STATE_NAMES = {
    CDMX: 'Ciudad de México',
    AGS:  'Aguascalientes',
    BC:   'Baja California',
    BCS:  'Baja California Sur',
    CAMP: 'Campeche',
    COAH: 'Coahuila',
    COL:  'Colima',
    CHIS: 'Chiapas',
    CHIH: 'Chihuahua',
    DGO:  'Durango',
    GTO:  'Guanajuato',
    GRO:  'Guerrero',
    HGO:  'Hidalgo',
    JAL:  'Jalisco',
    MEX:  'Estado de México',
    MICH: 'Michoacán',
    MOR:  'Morelos',
    NAY:  'Nayarit',
    NL:   'Nuevo León',
    OAX:  'Oaxaca',
    PUE:  'Puebla',
    QRO:  'Querétaro',
    QROO: 'Quintana Roo',
    SLP:  'San Luis Potosí',
    SIN:  'Sinaloa',
    SON:  'Sonora',
    TAB:  'Tabasco',
    TAMP: 'Tamaulipas',
    TLAX: 'Tlaxcala',
    VER:  'Veracruz',
    YUC:  'Yucatán',
    ZAC:  'Zacatecas'
  }.freeze

  included do
    # Name your field state on your database
    enum state: STATE_NAMES
  end

  # Instance method to easily fetch the full string name of the current state
  def state_full_name
    return nil unless state.present?
    STATE_NAMES[state.to_sym]
  end
end