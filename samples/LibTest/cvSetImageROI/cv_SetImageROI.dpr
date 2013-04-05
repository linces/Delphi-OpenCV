// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
// JCL_DEBUG_EXPERT_INSERTJDBG OFF
// JCL_DEBUG_EXPERT_DELETEMAPFILE OFF
program cv_SetImageROI;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
{$I ..\..\uses_include.inc}
  ;

Const
  // ��� ��������
  filename = 'Resource\cat2.jpg';

var
  image: PIplImage = nil;
  x: Integer;
  y: Integer;
  width: Integer;
  height: Integer;
  add: Integer;

begin
  try

    image := cvLoadImage(filename, 1);

    Writeln('[i] image: ', filename);
    if not Assigned(image) then
      Halt;

    cvNamedWindow('origianl', CV_WINDOW_AUTOSIZE);
    cvNamedWindow('ROI', CV_WINDOW_AUTOSIZE);

    // ����� ROI
    x      := 140;
    y      := 120;
    width  := 200;
    height := 200;
    // ���������� ��������
    add := 200;

    cvShowImage('origianl', image);
    // ������������� ROI
    cvSetImageROI(image, cvRect(x, y, width, height));
    cvAddS(image, cvScalar(add), image);
    // ���������� ROI
    cvResetImageROI(image);
    // ���������� �����������
    cvShowImage('ROI', image);
    // ��� ������� �������
    cvWaitKey(0);
    // ����������� �������
    cvReleaseImage(image);
    cvDestroyAllWindows;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
