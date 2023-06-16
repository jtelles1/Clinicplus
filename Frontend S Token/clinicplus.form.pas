unit clinicplus.form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.MultiView,
  FMX.ListBox, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.TabControl, FMX.ANI,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, System.JSON,
  FMX.Edit;

type
  TClinicPlusForm = class(TForm)
    TopRCT: TRectangle;
    MenuBTN: TButton;
    Label1: TLabel;
    AtualizarBTN: TButton;
    ButtonRCT: TRectangle;
    ScheduleLYT: TLayout;
    SchedulePTH: TPath;
    HomeLYT: TLayout;
    HomePTH: TPath;
    HistoryLYT: TLayout;
    HistoryPTH: TPath;
    AnimeLYT: TLayout;
    AnimeRCT: TRectangle;
    MultiView1: TMultiView;
    MenuLST: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ContentTBC: TTabControl;
    ScheduleTBC: TTabItem;
    HomeTBC: TTabItem;
    HistoryTBC: TTabItem;
    HistoryLTV: TListView;
    ScheduleLTV: TListView;
    Layout1: TLayout;
    Circle1: TCircle;
    NameLBL: TLabel;
    CPFLBL: TLabel;
    clienteMTB: TFDMemTable;
    AgendamentoMTB: TFDMemTable;
    HistoricoMTB: TFDMemTable;
    clienteMTBidcliete: TAutoIncField;
    clienteMTBNome: TStringField;
    clienteMTBCPF: TStringField;
    clienteMTBNascimento: TDateTimeField;
    clienteMTBfoto: TBlobField;
    AgendamentoMTBidfuncionario: TIntegerField;
    AgendamentoMTBidcliente: TIntegerField;
    AgendamentoMTBidlocal: TIntegerField;
    AgendamentoMTBidadmin: TIntegerField;
    AgendamentoMTBdata_agendamento: TDateField;
    AgendamentoMTBhora_agendamento: TTimeField;
    AgendamentoMTBdata_atendimento: TDateField;
    AgendamentoMTBhora_atendimento: TTimeField;
    AgendamentoMTBdata_confirmacao: TDateTimeField;
    AgendamentoMTBdata_cadastro: TDateTimeField;
    AgendamentoMTBfg_status: TStringField;
    AgendamentoMTBprofissional: TStringField;
    AgendamentoMTBpaciente: TStringField;
    AgendamentoMTBlocal: TStringField;
    AgendamentoMTBidagendamento: TFDAutoIncField;
    HistoricoMTBidagendamento: TFDAutoIncField;
    HistoricoMTBidfuncionario: TIntegerField;
    HistoricoMTBidcliente: TIntegerField;
    HistoricoMTBidlocal: TIntegerField;
    HistoricoMTBidadmin: TIntegerField;
    HistoricoMTBdata_agendamento: TDateField;
    HistoricoMTBhora_agendamento: TTimeField;
    HistoricoMTBdata_atendimento: TDateField;
    HistoricoMTBhora_atendimento: TTimeField;
    HistoricoMTBdata_confirmacao: TDateTimeField;
    HistoricoMTBdata_cadastro: TDateTimeField;
    HistoricoMTBfg_status: TStringField;
    HistoricoMTBprofissional: TStringField;
    HistoricoMTBpaciente: TStringField;
    HistoricoMTBlocal: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    IDEDT: TEdit;
    CPFEDT: TEdit;
    EntrarBTN: TButton;
    LoginFotoCIR: TCircle;
    procedure ScheduleLYTClick(Sender: TObject);
    procedure HistoryLYTClick(Sender: TObject);
    procedure HomeLYTClick(Sender: TObject);
    procedure AtualizarBTNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScheduleLTVButtonClick(const Sender: TObject;
      const AItem: TListItem; const AObject: TListItemSimpleControl);
    procedure EntrarBTNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetAgendamento(const AToken: String);
    procedure GetHistorico(const AToken: String);

    procedure GetCliente(const AToken: String);   //declara a função getCliente
    procedure LoadCliente (const AToken: String); //declara a funçã LoadCliente

    procedure ChangeSchedule(atoken:string; AID: integer; JSON: TJSONObject);
    procedure Login (const ID, CPF: String);
  end;

const
  EnderecoServidor = 'http://192.168.137.1:9000/';
  //EnderecoServidor = 'http://localhost:9000/';

  // Concatenado, porque delph não suporta literal maior que 255 caracteres
//  Token = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODU3MDM1NzY'+
//  'sImV4cCI6MTY4NTc4OTk3NiwiaXNzIjoibG9jYWxob3N0IiwiaWQiOiIxIiwibm9tZSI6IkRFTk'+
//  'lMU09OIE1PUklMSU4iLCJjcGYiOiI0NDQuNDQ0LjQ0NC00NCIsIm5hc2NpbWVudG8iOiIxOFwvM'+
//  'TBcLzE5NzIifQ.sWzluHVg7CwxzooQWGlMnR2Xoq5-a2uusSE7xBShSOc';

var
  ClinicPlusForm: TClinicPlusForm;
  token: String;
  // UsuarioID : integer;

implementation

uses RESTRequest4D, Dataset.Serialize, System.threading;

{$R *.fmx}

procedure TClinicPlusForm.AtualizarBTNClick(Sender: TObject);
begin
  TTask.Run(procedure
  begin

    LoadCliente(Token);
    GetAgendamento(Token);
    GetHistorico(Token);
  end);
end;

procedure TClinicPlusForm.ChangeSchedule(atoken:string; AID: integer; JSON: TJSONObject);
begin

 TRequest.New.BaseURL(EnderecoServidor+'agendamento')   //
  .AddHeader('Authorization', AToken, [poDoNotEncode])
  .ResourceSuffix(AID.ToString)
  .AddBody(JSON, False)
  .Accept('application/json')
  .Put;


end;

procedure TClinicPlusForm.EntrarBTNClick(Sender: TObject);
begin

  if (IDEDT.Text = ' ') or (CPFEDT.TEXT = '')then
     raise Exception.Create('Informe o ID e o CPF');

  TTask.Run(procedure
   Begin
    Login(IDEDT.Text, CPFEDT.Text);

    LoadCliente(Token);
    GetAgendamento(Token);
    GetHistorico(Token);

    TThread.Synchronize(TThread.Current, procedure begin
      LoginFotoCIR.Fill.Bitmap.Assign( Circle1.Fill.Bitmap);

      MultiView1.HideMaster;
    end);
   End);


end;

procedure TClinicPlusForm.FormCreate(Sender: TObject);
begin
tdatasetSerializeConfig.GetInstance.CaseNameDefinition := TCaseNameDefinition.CNDLower;

AnimeRCT.Position.X := HomeLYT.Position.X;

  //TTask.Run(procedure
  //begin
    //LoadCliente(Token);
    //GetAgendamento(Token);
   // GetHistorico(Token);
  //end);

    MultiView1.ShowMaster;
    IDEDT.SetFocus;
end;

procedure TClinicPlusForm.GetAgendamento(const AToken: String);
begin
  TRequest.New.BaseURL(EnderecoServidor+'agendamento')   //
  .AddHeader('Authorization', AToken, [poDoNotEncode])
  .AddParam('fg_status', 'a')
  //.AddParam('idcliente' , ID.ToString)
  .Accept('application/json')
  .DataSetAdapter(AgendamentoMTB)
  .Get;
end;

procedure TClinicPlusForm.GetCliente(const AToken: String);
begin
 TRequest.New.BaseURL(EnderecoServidor+'cliente')   //
  .AddHeader('Authorization', AToken, [poDoNotEncode])
  // .resourceSuffix(ID.ToString)
  .Accept('application/json')
  .DataSetAdapter(clienteMTB)
  .Get;
end;

procedure TClinicPlusForm.GetHistorico(const AToken: String);
begin
  TRequest.New.BaseURL(EnderecoServidor+'agendamento')   //
  // .AddParam('idcliente' , ID.ToString)
  .AddHeader('Authorization', AToken, [poDoNotEncode])
  .Accept('application/json')
  .DataSetAdapter(HistoricoMTB)
  .Get;
end;

procedure TClinicPlusForm.HistoryLYTClick(Sender: TObject);
begin
  tanimator         //declarar no uses (em cima) FMX.ANI;
    .animateFloat(animeRCT,                    //objeto que será animado
                  'Position.x',                //propriedade que será animado
                  Historylyt.Position.x,      //valor da prop.ao final da animação
                  0.5,                         //duração da animação
                  tanimationType.out,          //tipo da animação (entrada/saida ou ambos)
                  tinterpolationType.bounce);  //tipo da interpolação

    ContentTBC
      .setactivetabwithtransition(
        HistoryTBC,                           //aba que sera exibida
        ttabtransition.slide,                  //animação a ser executada
        ttabtransitionDirection.normal);      //direção da animação
        //nil                                   //Ponteiro p/ função ser executada após conclusão da animação

end;

procedure TClinicPlusForm.HomeLYTClick(Sender: TObject);
var
transicao: ttabtransitionDirection;

begin
  if contentTBC.ActiveTAB.index>homeTBC.index then
  begin
    transicao := ttabtransitionDirection.reversed;
  end
  else
  begin
    transicao := ttabtransitionDirection.normal;
  end;

  tanimator      //declarar no uses (em cima) FMX.ANI;
    .animateFloat(animeRCT,                    //objeto que será animado
                  'Position.x',                //propriedade que será animado
                  Homelyt.Position.x,          //valor da prop.ao final da animação
                  0.5,                         //duração da animação
                  tanimationType.out,          //tipo da animação (entrada/saida ou ambos)
                  tinterpolationType.bounce);  //tipo da interpolação

    ContentTBC
      .setactivetabwithtransition(
        HomeTBC,                               //aba que sera exibida
        ttabtransition.slide,                  //animação a ser executada
        transicao);                            //direção da animação
        //nil                                   //Ponteiro p/ função ser executada após conclusão da animação


end;

procedure TClinicPlusForm.LoadCliente(const AToken: String);
var
  FotoStream: TMemoryStream;
  BrushBMP: TBrushBitmap;
begin
  // GetCliente(ID); //requisição backend (api)
  GetCliente(AToken);

  TThread.Synchronize(TThread.CurrentThread, procedure

  begin
  nameLBL.Text := ClienteMTB.FieldByName('nome').AsString;
  cpfLBL.Text := ClienteMTB.FieldByName('cpf').AsString;

  FotoStream := TMemoryStream.Create; //cria a stream
  BrushBMP := TBrushBitmap.Create; //cia a instancia do pincel

  try
    TBlobField(ClienteMTB.fieldbyName ('foto')).SaveToStream(FotoStream);   //grava a foto do campo na stream
    BrushBMP.BitMap.LoadFromStream (fotoStream); //Formatando a foto com Brush
    BrushBMP.WrapMode := TWrapMode.TileStretch; //Ajustando o tamanho da imagem de acordo com o tamanho do componente
    Circle1.Fill.Bitmap.Assign(BrushBMP);  //Desenha imagem do componente (circle 1)
  finally
    FotoStream.Free; // libera memoria
    BrushBMP.Free; // libera memoria
  end;

  end);
end;

procedure TClinicPlusForm.Login(const ID, CPF: String);
var
JSON: TJSONObject;
Resposta: IResponse;
begin
  JSON := TJSONObject.Create;
  try

    JSON.AddPair('idcliente', ID);
    JSON.AddPair('cpf',cpf);
  try
    Resposta := TRequest.New
                .BaseURL(EnderecoServidor+'token')
                .AddBody(JSON, False)
                .Accept('application/json')
                .Post;
    if Resposta.StatusCode = 200 then begin
      Token := 'Bearer ' +Resposta.Content;
    end
    else begin
      ShowMessage('Falha na autenticação: ' +Resposta.Content);
    end;
    except
      On E:Exception do begin
        ShowMessage('Falha no login: '+E.Message);
      end;
      end;
  finally
      JSON.Free;
  end;

end;

procedure TClinicPlusForm.ScheduleLTVButtonClick(const Sender: TObject;
  const AItem: TListItem; const AObject: TListItemSimpleControl);
  var
  JSON: TJSONObject;

  begin

    if AObject.Name.ToLower = 'confirmabutton' then
    begin
        AgendamentoMTB.Edit;
        AgendamentoMTBfg_status.AsString := 'C';
        AgendamentoMTBdata_confirmacao.Value :=  Now;
        AgendamentoMTB.Post;
        JSON := AgendamentoMTB.ToJSONObject();

        ChangeSchedule(token, AgendamentoMTBidagendamento.Value, JSON);
        JSON.Free;

        // Provavel erro nessa versão, que fazia o botao confirmabutton não confirmar o agendamento.
        // Mudava no meio do pracosso para o cancelabutton, onde so era possivel cancelar o agendamento.
        // com isso repetimos o codigo abaixo (que era colocado somente abaixo do cancelabutton).

        TTask.Run(procedure
        begin
          Sleep(200);
          AgendamentoMTB.EmptyDataSet;
          HistoricoMTB.EmptyDataSet;
          GetAgendamento(Token);
          GetHistorico(Token);
        end);
        exit;

        // E colocamos esse exit (aqui em cima) para ele sair da função antes de começar a proxima.
        // Ja que estava dando erro como descrito acima.

    end;

    if AObject.Name.ToLower = 'cancelabutton' then
    begin
        AgendamentoMTB.Edit;
        AgendamentoMTBfg_status.AsString := 'I';
        AgendamentoMTBdata_confirmacao.Value :=  Now;
        AgendamentoMTB.Post;
        JSON := AgendamentoMTB.ToJSONObject();

        ChangeSchedule(token, AgendamentoMTBidagendamento.Value, JSON);
        JSON.Free;
    end;

    TTask.Run(procedure
    begin
      Sleep(200);
      AgendamentoMTB.EmptyDataSet;
      HistoricoMTB.EmptyDataSet;
      GetAgendamento(Token);
      GetHistorico(Token);
    end);

  end;

procedure TClinicPlusForm.ScheduleLYTClick(Sender: TObject);
begin
  tanimator      //declarar no uses (em cima) FMX.ANI;
    .animateFloat(animeRCT,                    //objeto que será animado
                  'Position.x',                //propriedade que será animado
                  schedulelyt.Position.x,      //valor da prop.ao final da animação
                  0.5,                         //duração da animação
                  tanimationType.out,          //tipo da animação (entrada/saida ou ambos)
                  tinterpolationType.bounce);  //tipo da interpolação

    ContentTBC
      .setactivetabwithtransition(
        scheduleTBC,                           //aba que sera exibida
        ttabtransition.slide,                  //animação a ser executada
        ttabtransitionDirection.Reversed);      //direção da animação
        //nil                                   //Ponteiro p/ função ser executada após conclusão da animação

end;

end.
