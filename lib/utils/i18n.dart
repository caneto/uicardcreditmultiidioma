import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static final _t = Translations("en_us") +
      {
        "en_us": "History",
        "pt_br": "Historia",
      } +
      {
        "en_us": "Cards",
        "pt_br": "Cartões",
      } +
      {
        "en_us": "Finance",
        "pt_br": "Financeiro",
      } +
      { 
        "en_us": "Select Card", 
        "pt_br": "Selecione o Cartão"
      } +
      {
        "en_us": "Hi, Charles",
        "pt_br": "Oi, Carlos",
      } +
      {
        "en_us": "Your Balance",
        "pt_br": "Seu balanço",
      } +
      {
        "en_us": "\$ 543,933.33",
        "pt_br": "R\$ 543.933,33",
      } +
      {
        "en_us": "CHARLES ALBERT",
        "pt_br": "CARLOS ALBERTO",
      }+
      {
        "en_us": "CHARLES ALBERT CP",
        "pt_br": "CARLOS ALBERTO CP",
      } +
      {
        "en_us": "YOUR SECURED CARD",
        "pt_br": "SEU CARTÃO SEGURO",
      } +
      {
        "en_us": "Confirm \$5400",
        "pt_br": "Confirme R\$ 5400",
      } +
      {
        "en_us": "Dr.Smith",
        "pt_br": "Dra. Smith",
      } +
      {
        "en_us": "VACCINE \nRV1(ROTARIX)",
        "pt_br": "VACINA \nRV1(ROTARIX)",
      } +
      {
        "en_us": "Dr.Tempsni",
        "pt_br": "Dra. Tempsni",
      }+
      {
        "en_us": "VACCINE \nHPV",
        "pt_br": "VACINA \nHPV",
      } +
      {
        "en_us": "Dr.Tempsni",
        "pt_br": "Dra. Tempsni",
      }+
      {
        "en_us": "VACCINE \nCOVID 19 (Pfizer)",
        "pt_br": "VACINA \nCOVID 19 (Pfizer",
      } +
      {
        "en_us": "Dr.Tempsni",
        "pt_br": "Dra. Tempsni",
      } +
      {
        "en_us": "Doctor",
        "pt_br": "Doutor(a)",
      } +
      {
        "en_us": "Theropist,virologist",
        "pt_br": "Terapeuta, virologista",
      } +
      {
        "en_us": "September 22,2022",
        "pt_br": "22 de setembro de 2022",
      } +
      {
        "en_us": "Edit",
        "pt_br": "Editar",
      } +
      {
        "en_us": "VACCINE",
        "pt_br": "VACINA",
      }+
      {
        "en_us": "DT(-GENERIC-) ST.112",
        "pt_br": "DT(-GENÉRICO-) ST.112",
      }+
      {
        "en_us": "Diphtheria",
        "pt_br": "Difteria",
      }+
      {
        "en_us": "Add appointment",
        "pt_br": "Adicionar compromisso",
      }+
      {
        "en_us": "DT(-GENERIC-)ST.112",
        "pt_br": "DT(-GENÉRICO-)ST.112",
      }+
      {
        "en_us": "Third time in clinic",
        "pt_br": "Terceira vez na clínica",
      }+
      {
        "en_us": "Septembar 25",
        "pt_br": "25 de setembro",
      }+
      {
        "en_us": "Septembar 26",
        "pt_br": "26 de setembro",
      }+
      {
        "en_us": "Septembar 28",
        "pt_br": "28 de setembro",
      }+
      {
        "en_us": "Septembar 22",
        "pt_br": "22 de setembro",
      }+
      {
        "en_us": "Schedule",
        "pt_br": "Cronograma",
      }+
      {
        "en_us": "DT(-generic-)st.112",
        "pt_br": "DT(-genérico-)st.112",
      }+
      {
        "en_us": "Tdap(Adacel)pt.4st89",
        "pt_br": "Tdap (Adacel) pt. 4st89",
      }+
      {
        "en_us": "Dr.Fiegel",
        "pt_br": "Dr. Fiegel",
      };

  String get i18n => localize(this, _t);
}