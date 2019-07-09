# frozen_string_literal: true

class GoogleSheetsSimulator
  def all
    [
      [
        'Client ONE',
        'Work Stream ONE',
        '2019-05-02',
        '2019-06-06',
        'Yusuf Sheikh',
        '',
        'TRUE',
        'TRUE',
        'TRUE',
        'TRUE'
      ],
      [
        'Client TWO',
        'Work Stream ONE',
        '2019-05-01',
        '2019-10-31',
        'George Schena',
        '',
        'TRUE',
        'TRUE',
        'TRUE',
        'TRUE'
      ],
      [
        'Client TWO',
        'Work Stream ONE',
        '2019-05-01',
        '2019-10-31',
        'Maysa Kanoni',
        '',
        'FALSE',
        'FALSE',
        'FALSE',
        'FALSE'
      ],
      [
        'Client TWO',
        'Work Stream TWO',
        '2019-07-15',
        '2019-09-02',
        'Maysa Kanoni',
        '',
        'TRUE',
        'TRUE',
        'TRUE',
        'TRUE'
      ]
    ]
  end
end
