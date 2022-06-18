
program untitled;

uses crt;

var have : char;
	pas : string;
	
	repit : boolean;
	
	scroll : byte;
	
	massive : array[1..100] of string;
	masWord : array[1..100] of string;
	
////////////////////////////
procedure cheak(st : string; Num : byte; scr : byte);
var TFile : text;
	words : string;
	
	wrst : string; //write string
	
	Similar : boolean; //подібний
	B : byte;
	
	repetitive : byte;
	
begin
	assign(TFile, 'Infinitive.txt');
	reset(TFile);
	
	repetitive := 0;
	
	for B := 1 to 100 do begin
	massive[B] := '';
	end;
	
	//for repetitive := 1 to Scroll do begin
					
		while not Eof(TFile) do begin
			wrst := '';
			Similar := true;
			
			readln(TFile, words);
			
			
			if pas[1] = words[1] then begin
				
				//призначення слова
				for B := 1 to length(words) do begin
					if words[B] = ' ' then break 
					else
					wrst := wrst + words[B];	
				end;
			
				//перевірка на схожість
				{if Num = 2 then
					if st = wrst then begin
					gotoxy(5,3);
					writeln(words);
				end
				else}
				for B := 2 to length(st) do begin
					if st[B] <> wrst[B] then
					similar := false;
				end;
				
			end
			else Similar := false;
			
			//запис слів у масив
			if similar then begin
				repetitive := repetitive + 1;
				massive[repetitive] := wrst;
				masWord[repetitive] := words;
				if Num = 1 then begin
					gotoxy(6,3);
					writeln('                                                        ');
					gotoxy(6,3);
					textcolor(7);
					writeln(masWord[scr]);
				end;
			end;
			
			
		end;
	
	gotoxy(1,1);
	
		if Num = 1 then begin
		pas := massive[scr];
		end;
		
		writeln(massive[scr], '               ');
			
	{if similar then begin
		if Num = 1 then
		pas := massive[scr]
		else writeln(massive[scr], '               ');
	end}
	//else writeln('                              ');
	
	close(TFile);
end;

////////////////////////
function back(st : string) : string;
var B : byte;
	st1 : string;
begin
	st1 := '';
	if length(st) >= 1 then
		for B := 1 to (length(st) - 1) do
			st1 := st1 + st[B];
	
	back := st1;
	
end;

////////////////////////////////////////////////////////////////////////

BEGIN
	repit := true;
	pas := '';
	scroll := 1;

	while repit do begin
	
	gotoxy(1,3);
	writeln('[', scroll, '] ');
	
	gotoxy(1,1);
	have := readkey;
		
		case have of
		#08:pas := back(pas); //стирання символу стрічки
		#09:begin	//дописування слова из варианту (тіпа, як в майнкрафті в консольці
			textcolor(1);
				cheak(pas, 1, scroll);
			textcolor(7);
			end;
		'+':begin if scroll < 100 then
				scroll := scroll + 1;
			end;
		'-':begin if scroll > 1 then
				scroll := scroll - 1;
				gotoxy(1,3);
				writeln('     ');
			end;
		else begin
				if length(pas) <= 15 then
					pas := pas + have; //додавання символу до стрічки
					scroll := 1;
			 end;
		end;


		//малювання на задньому фоні можливе слово із вибору
		if length(pas) > 0 then begin
			textcolor(1);
				cheak(pas, 0, scroll);
			textcolor(7);
		end
		else writeln('              ');
	
		gotoxy(1,1);
		write(pas);
	
	end;
END.

