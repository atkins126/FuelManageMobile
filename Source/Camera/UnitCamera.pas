unit UnitCamera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Media, FMX.Objects,
  ZXing.ScanManager,
  ZXing.ReadResult,
  ZXing.BarcodeFormat,
  FMX.Platform, FMX.Layouts;

type
  TFrmCamera = class(TForm)
    CameraComponent: TCameraComponent;
    lbl_erro: TLabel;
    img_camera: TImage;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout31: TLayout;
    Rectangle16: TRectangle;
    btnVoltar: TSpeedButton;
    Label1: TLabel;
    Layout3: TLayout;
    pb1: TProgressBar;
    procedure CameraComponentSampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    FScanManager : TScanManager;
    FScanInProgress : Boolean;
    FFrameTake : Integer;
    fScanBitmap: TBitmap;
    procedure ProcessarImagem;
    procedure ParseImage();
    { Private declarations }
  public
    { Public declarations }
    codigo : string;
  end;

var
  FrmCamera: TFrmCamera;

implementation

{$R *.fmx}

procedure TFrmCamera.FormCreate(Sender: TObject);
begin
  FScanManager := TScanManager.Create(TBarcodeFormat.Auto, nil);
end;

procedure TFrmCamera.FormDestroy(Sender: TObject);
begin
  if Assigned(fScanBitmap) then
    FreeAndNil(fScanBitmap);
//  CameraComponent.Active := false;
//  FScanManager.DisposeOf;
end;

procedure TFrmCamera.FormShow(Sender: TObject);
begin
 codigo                    :='0';
 FFrameTake                :=0;
 fScanBitmap               := nil;
 CameraComponent.Active    := false;
 CameraComponent.Kind      := TCameraKind.BackCamera;
 CameraComponent.FocusMode := TFocusMode.ContinuousAutoFocus;
 CameraComponent.Quality   := TVideoCaptureQuality.MediumQuality;
 CameraComponent.Active    := true;
end;

procedure TFrmCamera.ParseImage;
begin
  TThread.CreateAnonymousThread(
  procedure
  var
   ReadResult: TReadResult;
   ScanManager: TScanManager;
  begin
   try
    fScanInProgress := True;
    ScanManager := TScanManager.Create(TBarcodeFormat.Auto, nil);
    try
     ReadResult := ScanManager.Scan(fScanBitmap);
    except
    on E: Exception do
     begin
      TThread.Synchronize(TThread.CurrentThread,
      procedure
      begin
       lbl_erro.Text := E.Message;
      end);
      exit;
     end;
    end;
    TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
     if (pb1.Value>=100) then
     begin
      pb1.Value := 0;
     end
     else
      pb1.Value := pb1.Value + 10;
     if (ReadResult <> nil) then
     begin
      codigo := ReadResult.Text;
      Close;
     end;
    end);
    finally
     if ReadResult <> nil then
      FreeAndNil(ReadResult);
     ScanManager.Free;
     fScanInProgress := false;
   end;
  end).Start();
end;

procedure TFrmCamera.ProcessarImagem;
var
    bmp : TBitmap;
    ReadResult : TReadResult;
begin
    CameraComponent.SampleBufferToBitmap(img_camera.Bitmap, true);

    if FScanInProgress then
        exit;

    inc(FFrameTake);

    if (FFrameTake mod 4 <> 0) then
        exit;

    bmp := TBitmap.Create;
    bmp.Assign(img_camera.Bitmap);
    ReadResult := nil;
    try
        FScanInProgress := true;
        try
            ReadResult := FScanManager.Scan(bmp);

            if ReadResult <> nil then
            begin
                CameraComponent.Active := false;
                codigo := ReadResult.text;
                close;
            end;

        except on ex:exception do
            lbl_erro.Text := ex.Message;
        end;
    finally
        bmp.DisposeOf;
        ReadResult.DisposeOf;
        FScanInProgress := false;
    end;

end;

procedure TFrmCamera.btnVoltarClick(Sender: TObject);
begin
    CameraComponent.Active := false;
    close;
end;

procedure TFrmCamera.CameraComponentSampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    CameraComponent.SampleBufferToBitmap(img_Camera.Bitmap, True);
    if (fScanInProgress) then
    begin
      exit;
    end;

    { This code will take every 4 frame. }
    inc(fFrameTake);
    if (fFrameTake mod 4 <> 0) then
    begin
      exit;
    end;

    if Assigned(fScanBitmap) then
      FreeAndNil(fScanBitmap);

    fScanBitmap := TBitmap.Create();
    fScanBitmap.Assign(img_Camera.Bitmap);

    ParseImage();
  end);
//  ProcessarImagem;
end;

end.
