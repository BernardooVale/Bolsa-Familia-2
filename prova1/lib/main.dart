import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

//main feito por Bernardo Vale dos Santos Bento

void main() {
  runApp(const MaterialApp(
    home: paginaPrincipal(),
  ));
}

class paginaPrincipal extends StatefulWidget {
  const paginaPrincipal({Key? key}) : super(key: key);

  @override
  State<paginaPrincipal> createState() => _paginaPrincipalState();
}

class _paginaPrincipalState extends State<paginaPrincipal> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _informacao = "", _dadosPessoa = "", numFilhos1 = "1 filho", numFilhos2 = "2 filhos", numFilhos3 = "3 ou mais",
      dropdown1 = "Selecione sua renda", dropdown2 = "Menor que 1 salário mínimo", dropdown3 = "Menor que 2 salários mínimos", dropdown4 = "Maior que 2 salários mínimos", Informacao1 = "Sem auxílio",
      semCondicao = "Insira sua condição", Condicao1 = "Todos os filhos estão na escola?", Condicao2 = "Todos os filhos estão vacinados?",
      Condicao3 = "Mãe solteira?";
  double resultado = 0;
  int _numFilho = 0, _lingua = 0, salarioMinimo = 1212;
  bool Checkbox1 = false, Checkbox2 = false, Checkbox3 = false;

  void _reiniciaDados(){

    setState(() {

      _informacao = "";
      _formKey = GlobalKey<FormState>();
      _lingua = 0;
      Checkbox1 = false;
      Checkbox2 = false;
      Checkbox3 = false;

    });
  }

  void mudaLingua(){

    if(_lingua == 0){

      setState(() {

        numFilhos1 = "1 filho";
        numFilhos2 = "2 filhos";
        numFilhos3 = "3 ou mais";
        dropdown1 = "Selecione sua renda";
        dropdown2 = "Menor que 1 salário mínimo";
        dropdown3 = "Menor que 2 salários mínimos";
        dropdown4 = "Maior que 2 salários mínimos";
        Informacao1 = "Sem auxílio";
        semCondicao = "Insira sua renda";
        Condicao1 = "Todos os filhos estão na escola?";
        Condicao2 = "Todos os filhos estão vacinados?";
        Condicao3 = "Mãe solteira?";

      });
    } else if(_lingua == 1){

      setState(() {

        numFilhos1 = "1 child";
        numFilhos2 = "2 children";
        numFilhos3 = "3 children+";
        dropdown1 = "Select your income";
        dropdown2 = "Less than 1 minimum wage";
        dropdown3 = "Less than 2 minimum wage";
        dropdown4 = "More than 2 minimum wage";
        Informacao1 = "No assistance";
        semCondicao = "Insert your income";
        Condicao1 = "All children are in school?";
        Condicao2 = "All children are vaccinated?";
        Condicao3 = "Solo mom?";

      });
    }
  }

  void _calculo(){

    setState(() {

      resultado = 0;

      if(Checkbox3 == true){

        resultado += 600;

      }

      if(Checkbox1 == true && Checkbox2 == true){

        if (_numFilho == 2){

          resultado += salarioMinimo * 3;

        } else if (_numFilho == 1){

          if(_dadosPessoa == "< 1 salario"){

            resultado += salarioMinimo * 2.5;

          } else if (_dadosPessoa == "< 2 salarios"){

            resultado += salarioMinimo * 1.5;
          }
        }
      }

      _informacao = resultado.toString();

      if(Checkbox3 != true && Checkbox1 != true && Checkbox2 != true){

        _informacao = Informacao1;

      }

      if(_dadosPessoa == "" && Checkbox3 != true){

        _informacao = semCondicao;

      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App JAM"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(20, 125, 30, 100),
        actions: <Widget>[
          IconButton(onPressed: _reiniciaDados,
              icon: const Icon(Icons.refresh)),
        ],
      ),
      backgroundColor: Colors.black38,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Icon(Icons.account_balance_wallet_rounded, size: 120.0, color: Color.fromRGBO(20, 125, 30, 100)),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
                child: DropdownButton(
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  style: const TextStyle(color: Colors.white70),
                  isExpanded: true,
                  dropdownColor: const Color.fromRGBO(64, 64, 64, 100),
                  items:[
                    DropdownMenuItem(value: "", child: Text(dropdown1)),
                    DropdownMenuItem(value: "< 1 salario", child: Text(dropdown2)),
                    DropdownMenuItem(value: "< 2 salarios", child: Text(dropdown3)),
                    DropdownMenuItem(value: "> 3 salarios", child: Text(dropdown4)),
                  ],
                  value: _dadosPessoa,
                  onChanged: (String? value) {

                    if(value is String){

                      setState(() {
                        _dadosPessoa = value;
                      });
                    }
                  },
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white70,
                ),
                child: CheckboxListTile(
                  activeColor: const Color.fromRGBO(20, 125, 30, 100),
                  title: Text(Condicao1,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  value: Checkbox1,
                  onChanged: (newValue) {
                    setState(() {
                      Checkbox1 = newValue!;
                    });
                  },
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white70,
                ),
                child: CheckboxListTile(
                  activeColor: const Color.fromRGBO(20, 125, 30, 100),
                  title: Text(Condicao2,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  value: Checkbox2,
                  onChanged: (newValue) {
                    setState(() {
                      Checkbox2 = newValue!;
                    });
                  },
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white70,
                ),
                child: CheckboxListTile(
                    activeColor: const Color.fromRGBO(20, 125, 30, 100),
                    title: Text(Condicao3,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    value: Checkbox3,
                    onChanged: (newValue) {
                      setState(() {
                        Checkbox3 = newValue!;
                      });
                    },
                  ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                child: Center(
                  child: ToggleSwitch(
                    minWidth: 100.0,
                    initialLabelIndex: 0,
                    cornerRadius: 20.0,
                    inactiveBgColor: Colors.grey,
                    totalSwitches: 3,
                    labels: [numFilhos1, numFilhos2, numFilhos3],
                    activeBgColors: const [[Color.fromRGBO(20, 125, 30, 100)],[Color.fromRGBO(20, 125, 30, 100)], [Color.fromRGBO(20, 125, 30, 100)]],
                    onToggle: (numFilho) {
                      _numFilho = numFilho!;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: ElevatedButton(
                  onPressed:(){
                    if(_formKey.currentState!.validate()) {
                      _calculo();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(20, 125, 30, 100),
                    fixedSize: const Size(250, 50),
                  ),
                  child: const Icon(Icons.attach_money_rounded, size: 40, color: Colors.white),
                ),
              ),
              Text(_informacao, style: const TextStyle(color: Colors.white70, fontSize: 25.0),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Center(
                  child: ToggleSwitch(
                    minWidth: 90,
                    initialLabelIndex: 0,
                    cornerRadius: 20.0,
                    inactiveBgColor: Colors.grey,
                    totalSwitches: 2,
                    labels: const ["Português", "English"],
                    activeBgColors: const [[Color.fromRGBO(20, 125, 30, 100)],[Color.fromRGBO(20, 125, 30, 100)]],
                    onToggle: (lingua) {
                      _lingua = lingua!;
                      mudaLingua();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
