require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMonstersDnD5()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setDataType("marcos_monsters_2025");
    obj:setTitle("Ficha de Monstros D&D do Marcão");
    obj:setName("frmMonstersDnD5");
    obj:setTheme("dark");
    obj.cacheMode = "time";
    obj:setDescription("@@dnd.sheet.description");

    obj.pgcPrincipal = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.pgcPrincipal:setParent(obj);
    obj.pgcPrincipal:setAlign("client");
    obj.pgcPrincipal:setName("pgcPrincipal");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.pgcPrincipal);
    obj.tab1:setTitle("@@plugin-mm.tabControl.tab.front");
    obj.tab1:setName("tab1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.tab1);
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#40000000");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);


		



		require("locale.lua");
	
		function self:sortSkillBoxesOf(attrName)	
			local sortData = self.__attrSortData;
			
			if sortData == nil then
				return;
			end;
			
			local attrSortData = sortData[attrName];
			
			if attrSortData == nil then
				return;
			end;
			
			table.sort(attrSortData,
				function (left, right)
					local leftStr = Locale.eval(left.title);
					local rightStr = Locale.eval(right.title);				
					return Utils.compareStringPtBr(leftStr, rightStr) < 0;
				end);
				
			for i = 1, #attrSortData, 1 do
				local ctrl = self:findControlByName(attrSortData[i].controlName);
				
				if ctrl ~= nil then
					local previousParent = ctrl:getParent();
					ctrl:setParent(nil);
					ctrl:setParent(previousParent);				
				end;
			end;			
		end;
	
		function self:sortFrontSkillBoxes()	
			self:sortSkillBoxesOf("forca");
			self:sortSkillBoxesOf("destreza");
			self:sortSkillBoxesOf("constituicao");
			self:sortSkillBoxesOf("inteligencia");
			self:sortSkillBoxesOf("sabedoria");
			self:sortSkillBoxesOf("carisma");
		end;
		
		



	


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.fraFrenteLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraFrenteLayout:setParent(obj.scrollBox1);
    obj.fraFrenteLayout:setAlign("top");
    obj.fraFrenteLayout:setHeight(500);
    obj.fraFrenteLayout:setMargins({left=10, right=10, top=10});
    obj.fraFrenteLayout:setAutoHeight(true);
    obj.fraFrenteLayout:setHorzAlign("center");
    obj.fraFrenteLayout:setLineSpacing(2);
    obj.fraFrenteLayout:setName("fraFrenteLayout");
    obj.fraFrenteLayout:setStepSizes({310, 420, 640, 760, 900, 1150, 1200});
    obj.fraFrenteLayout:setMinScaledWidth(300);
    obj.fraFrenteLayout:setVertAlign("leading");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.fraFrenteLayout);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMinScaledWidth(290);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");
    obj.flowLayout1:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout1:setVertAlign("leading");

    obj.flwNome1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwNome1:setParent(obj.flowLayout1);
    obj.flwNome1:setName("flwNome1");
    obj.flwNome1:setMinWidth(320);
    obj.flwNome1:setMaxWidth(1600);
    obj.flwNome1:setFrameStyle("frames/banner/dragon.xml");
    obj.flwNome1:setHeight(175);
    obj.flwNome1:setVertAlign("center");
    obj.flwNome1:setAvoidScale(true);
    obj.flwNome1:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layNomeHolderFrente = GUI.fromHandle(_obj_newObject("layout"));
    obj.layNomeHolderFrente:setParent(obj.flwNome1);
    obj.layNomeHolderFrente:setAlign("client");
    obj.layNomeHolderFrente:setName("layNomeHolderFrente");

    obj.edtNome1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtNome1:setParent(obj.layNomeHolderFrente);
    obj.edtNome1:setName("edtNome1");
    obj.edtNome1:setField("nome");
    obj.edtNome1:setFontSize(17);
    obj.edtNome1:setAlign("client");
    obj.edtNome1:setFontColor("white");
    obj.edtNome1:setVertTextAlign("center");
    obj.edtNome1:setTransparent(true);

    obj.labNome1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labNome1:setParent(obj.layNomeHolderFrente);
    obj.labNome1:setMargins({left=3});
    obj.labNome1:setName("labNome1");
    obj.labNome1:setAlign("bottom");
    obj.labNome1:setText("@@DnD5e.frente.lab.characterName");
    obj.labNome1:setAutoSize(true);
    obj.labNome1:setFontSize(12);
    obj.labNome1:setFontColor("#D0D0D0");

    obj.fraUpperGridFrente = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridFrente:setParent(obj.flowLayout1);
    obj.fraUpperGridFrente:setMinWidth(320);
    obj.fraUpperGridFrente:setMaxWidth(1600);
    obj.fraUpperGridFrente:setName("fraUpperGridFrente");
    obj.fraUpperGridFrente:setAvoidScale(true);
    obj.fraUpperGridFrente:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridFrente:setAutoHeight(true);
    obj.fraUpperGridFrente:setVertAlign("trailing");
    obj.fraUpperGridFrente:setMaxControlsPerLine(3);
    obj.fraUpperGridFrente:setMargins({left=1, right=1, top=2, bottom=2});

    obj.UpperGridCampo1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo1:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo1:setHeight(50);
    obj.UpperGridCampo1:setMinScaledWidth(100);
    obj.UpperGridCampo1:setMinWidth(100);
    obj.UpperGridCampo1:setMaxWidth(233);
    obj.UpperGridCampo1:setMaxScaledWidth(233);
    obj.UpperGridCampo1:setAvoidScale(true);
    obj.UpperGridCampo1:setName("UpperGridCampo1");
    obj.UpperGridCampo1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo1:setVertAlign("leading");

    obj.edtUpperGridCampo1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.edtUpperGridCampo1:setName("edtUpperGridCampo1");
    obj.edtUpperGridCampo1:setAlign("top");
    obj.edtUpperGridCampo1:setField("classeENivel");
    obj.edtUpperGridCampo1:setFontSize(13);
    obj.edtUpperGridCampo1:setHeight(30);
    obj.edtUpperGridCampo1:setTransparent(true);
    obj.edtUpperGridCampo1:setVertTextAlign("trailing");
    obj.edtUpperGridCampo1:setWidth(195);
    obj.edtUpperGridCampo1:setFontColor("white");

    obj.linUpperGridCampo1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.linUpperGridCampo1:setName("linUpperGridCampo1");
    obj.linUpperGridCampo1:setAlign("top");
    obj.linUpperGridCampo1:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo1:setStrokeSize(1);

    obj.labUpperGridCampo1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.labUpperGridCampo1:setName("labUpperGridCampo1");
    obj.labUpperGridCampo1:setAlign("top");
    obj.labUpperGridCampo1:setText("@@DnD5e.frente.lab.classaLevel");
    obj.labUpperGridCampo1:setVertTextAlign("leading");
    obj.labUpperGridCampo1:setWordWrap(true);
    obj.labUpperGridCampo1:setTextTrimming("none");
    obj.labUpperGridCampo1:setFontSize(12);
    obj.labUpperGridCampo1:setFontColor("#D0D0D0");

    self.UpperGridCampo1:setHeight(self.edtUpperGridCampo1:getHeight() + self.labUpperGridCampo1:getHeight() + self.linUpperGridCampo1:getHeight());


    obj.UpperGridCampo2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo2:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo2:setHeight(50);
    obj.UpperGridCampo2:setMinScaledWidth(100);
    obj.UpperGridCampo2:setMinWidth(100);
    obj.UpperGridCampo2:setMaxWidth(233);
    obj.UpperGridCampo2:setMaxScaledWidth(233);
    obj.UpperGridCampo2:setAvoidScale(true);
    obj.UpperGridCampo2:setName("UpperGridCampo2");
    obj.UpperGridCampo2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo2:setVertAlign("leading");

    obj.edtUpperGridCampo2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.edtUpperGridCampo2:setName("edtUpperGridCampo2");
    obj.edtUpperGridCampo2:setAlign("top");
    obj.edtUpperGridCampo2:setField("antecedentes");
    obj.edtUpperGridCampo2:setFontSize(13);
    obj.edtUpperGridCampo2:setHeight(30);
    obj.edtUpperGridCampo2:setTransparent(true);
    obj.edtUpperGridCampo2:setVertTextAlign("trailing");
    obj.edtUpperGridCampo2:setWidth(195);
    obj.edtUpperGridCampo2:setFontColor("white");

    obj.linUpperGridCampo2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.linUpperGridCampo2:setName("linUpperGridCampo2");
    obj.linUpperGridCampo2:setAlign("top");
    obj.linUpperGridCampo2:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo2:setStrokeSize(1);

    obj.labUpperGridCampo2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.labUpperGridCampo2:setName("labUpperGridCampo2");
    obj.labUpperGridCampo2:setAlign("top");
    obj.labUpperGridCampo2:setText("@@DnD5e.frente.lab.background");
    obj.labUpperGridCampo2:setVertTextAlign("leading");
    obj.labUpperGridCampo2:setWordWrap(true);
    obj.labUpperGridCampo2:setTextTrimming("none");
    obj.labUpperGridCampo2:setFontSize(12);
    obj.labUpperGridCampo2:setFontColor("#D0D0D0");

    self.UpperGridCampo2:setHeight(self.edtUpperGridCampo2:getHeight() + self.labUpperGridCampo2:getHeight() + self.linUpperGridCampo2:getHeight());


    obj.UpperGridCampo3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo3:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo3:setHeight(50);
    obj.UpperGridCampo3:setMinScaledWidth(100);
    obj.UpperGridCampo3:setMinWidth(100);
    obj.UpperGridCampo3:setMaxWidth(233);
    obj.UpperGridCampo3:setMaxScaledWidth(233);
    obj.UpperGridCampo3:setAvoidScale(true);
    obj.UpperGridCampo3:setName("UpperGridCampo3");
    obj.UpperGridCampo3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo3:setVertAlign("leading");

    obj.edtUpperGridCampo3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.edtUpperGridCampo3:setName("edtUpperGridCampo3");
    obj.edtUpperGridCampo3:setAlign("top");
    obj.edtUpperGridCampo3:setField("nomeDoJogador");
    obj.edtUpperGridCampo3:setFontSize(13);
    obj.edtUpperGridCampo3:setHeight(30);
    obj.edtUpperGridCampo3:setTransparent(true);
    obj.edtUpperGridCampo3:setVertTextAlign("trailing");
    obj.edtUpperGridCampo3:setWidth(195);
    obj.edtUpperGridCampo3:setFontColor("white");

    obj.linUpperGridCampo3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.linUpperGridCampo3:setName("linUpperGridCampo3");
    obj.linUpperGridCampo3:setAlign("top");
    obj.linUpperGridCampo3:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo3:setStrokeSize(1);

    obj.labUpperGridCampo3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.labUpperGridCampo3:setName("labUpperGridCampo3");
    obj.labUpperGridCampo3:setAlign("top");
    obj.labUpperGridCampo3:setText("@@DnD5e.frente.lab.player");
    obj.labUpperGridCampo3:setVertTextAlign("leading");
    obj.labUpperGridCampo3:setWordWrap(true);
    obj.labUpperGridCampo3:setTextTrimming("none");
    obj.labUpperGridCampo3:setFontSize(12);
    obj.labUpperGridCampo3:setFontColor("#D0D0D0");

    self.UpperGridCampo3:setHeight(self.edtUpperGridCampo3:getHeight() + self.labUpperGridCampo3:getHeight() + self.linUpperGridCampo3:getHeight());


    obj.UpperGridCampo4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo4:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo4:setHeight(50);
    obj.UpperGridCampo4:setMinScaledWidth(100);
    obj.UpperGridCampo4:setMinWidth(100);
    obj.UpperGridCampo4:setMaxWidth(233);
    obj.UpperGridCampo4:setMaxScaledWidth(233);
    obj.UpperGridCampo4:setAvoidScale(true);
    obj.UpperGridCampo4:setName("UpperGridCampo4");
    obj.UpperGridCampo4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo4:setVertAlign("leading");

    obj.edtUpperGridCampo4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.edtUpperGridCampo4:setName("edtUpperGridCampo4");
    obj.edtUpperGridCampo4:setAlign("top");
    obj.edtUpperGridCampo4:setField("raca");
    obj.edtUpperGridCampo4:setFontSize(13);
    obj.edtUpperGridCampo4:setHeight(30);
    obj.edtUpperGridCampo4:setTransparent(true);
    obj.edtUpperGridCampo4:setVertTextAlign("trailing");
    obj.edtUpperGridCampo4:setWidth(195);
    obj.edtUpperGridCampo4:setFontColor("white");

    obj.linUpperGridCampo4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.linUpperGridCampo4:setName("linUpperGridCampo4");
    obj.linUpperGridCampo4:setAlign("top");
    obj.linUpperGridCampo4:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo4:setStrokeSize(1);

    obj.labUpperGridCampo4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.labUpperGridCampo4:setName("labUpperGridCampo4");
    obj.labUpperGridCampo4:setAlign("top");
    obj.labUpperGridCampo4:setText("@@DnD5e.frente.lab.race");
    obj.labUpperGridCampo4:setVertTextAlign("leading");
    obj.labUpperGridCampo4:setWordWrap(true);
    obj.labUpperGridCampo4:setTextTrimming("none");
    obj.labUpperGridCampo4:setFontSize(12);
    obj.labUpperGridCampo4:setFontColor("#D0D0D0");

    self.UpperGridCampo4:setHeight(self.edtUpperGridCampo4:getHeight() + self.labUpperGridCampo4:getHeight() + self.linUpperGridCampo4:getHeight());


    obj.UpperGridCampo5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo5:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo5:setHeight(50);
    obj.UpperGridCampo5:setMinScaledWidth(100);
    obj.UpperGridCampo5:setMinWidth(100);
    obj.UpperGridCampo5:setMaxWidth(233);
    obj.UpperGridCampo5:setMaxScaledWidth(233);
    obj.UpperGridCampo5:setAvoidScale(true);
    obj.UpperGridCampo5:setName("UpperGridCampo5");
    obj.UpperGridCampo5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo5:setVertAlign("leading");

    obj.edtUpperGridCampo5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.edtUpperGridCampo5:setName("edtUpperGridCampo5");
    obj.edtUpperGridCampo5:setAlign("top");
    obj.edtUpperGridCampo5:setField("tendencia");
    obj.edtUpperGridCampo5:setFontSize(13);
    obj.edtUpperGridCampo5:setHeight(30);
    obj.edtUpperGridCampo5:setTransparent(true);
    obj.edtUpperGridCampo5:setVertTextAlign("trailing");
    obj.edtUpperGridCampo5:setWidth(195);
    obj.edtUpperGridCampo5:setFontColor("white");

    obj.linUpperGridCampo5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.linUpperGridCampo5:setName("linUpperGridCampo5");
    obj.linUpperGridCampo5:setAlign("top");
    obj.linUpperGridCampo5:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo5:setStrokeSize(1);

    obj.labUpperGridCampo5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.labUpperGridCampo5:setName("labUpperGridCampo5");
    obj.labUpperGridCampo5:setAlign("top");
    obj.labUpperGridCampo5:setText("@@DnD5e.frente.lab.trend");
    obj.labUpperGridCampo5:setVertTextAlign("leading");
    obj.labUpperGridCampo5:setWordWrap(true);
    obj.labUpperGridCampo5:setTextTrimming("none");
    obj.labUpperGridCampo5:setFontSize(12);
    obj.labUpperGridCampo5:setFontColor("#D0D0D0");

    self.UpperGridCampo5:setHeight(self.edtUpperGridCampo5:getHeight() + self.labUpperGridCampo5:getHeight() + self.linUpperGridCampo5:getHeight());


    obj.UpperGridCampo6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo6:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo6:setHeight(50);
    obj.UpperGridCampo6:setMinScaledWidth(100);
    obj.UpperGridCampo6:setMinWidth(100);
    obj.UpperGridCampo6:setMaxWidth(233);
    obj.UpperGridCampo6:setMaxScaledWidth(233);
    obj.UpperGridCampo6:setAvoidScale(true);
    obj.UpperGridCampo6:setName("UpperGridCampo6");
    obj.UpperGridCampo6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo6:setVertAlign("leading");

    obj.edtUpperGridCampo6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.edtUpperGridCampo6:setName("edtUpperGridCampo6");
    obj.edtUpperGridCampo6:setAlign("top");
    obj.edtUpperGridCampo6:setField("experiencia.valor");
    obj.edtUpperGridCampo6:setFontSize(13);
    obj.edtUpperGridCampo6:setHeight(30);
    obj.edtUpperGridCampo6:setTransparent(true);
    obj.edtUpperGridCampo6:setVertTextAlign("trailing");
    obj.edtUpperGridCampo6:setWidth(195);
    obj.edtUpperGridCampo6:setFontColor("white");

    obj.linUpperGridCampo6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.linUpperGridCampo6:setName("linUpperGridCampo6");
    obj.linUpperGridCampo6:setAlign("top");
    obj.linUpperGridCampo6:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo6:setStrokeSize(1);

    obj.labUpperGridCampo6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.labUpperGridCampo6:setName("labUpperGridCampo6");
    obj.labUpperGridCampo6:setAlign("top");
    obj.labUpperGridCampo6:setText("@@DnD5e.frente.lab.xp");
    obj.labUpperGridCampo6:setVertTextAlign("leading");
    obj.labUpperGridCampo6:setWordWrap(true);
    obj.labUpperGridCampo6:setTextTrimming("none");
    obj.labUpperGridCampo6:setFontSize(12);
    obj.labUpperGridCampo6:setFontColor("#D0D0D0");

    self.UpperGridCampo6:setHeight(self.edtUpperGridCampo6:getHeight() + self.labUpperGridCampo6:getHeight() + self.linUpperGridCampo6:getHeight());


    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.fraFrenteLayout);
    obj.flowLayout2:setHorzAlign("justify");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setAvoidScale(true);
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout2:setMinScaledWidth(300);
    obj.flowLayout2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout2:setVertAlign("leading");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout2);
    obj.flowPart1:setMinWidth(280);
    obj.flowPart1:setMaxWidth(800);
    obj.flowPart1:setHeight(64);
    obj.flowPart1:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart1:setVertAlign("leading");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("left");
    obj.edit1:setField("bonusProficiencia");
    obj.edit1:setWidth(70);
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(15);
    obj.edit1:setFontColor("white");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("client");
    obj.label1:setText("@@DnD5e.frente.lab.proficiencyBonus");
    obj.label1:setMargins({left=10});
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");
    obj.label1:setFontSize(12);
    obj.label1:setFontColor("#D0D0D0");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout2);
    obj.flowPart2:setMinWidth(280);
    obj.flowPart2:setMaxWidth(800);
    obj.flowPart2:setHeight(64);
    obj.flowPart2:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart2:setVertAlign("leading");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("left");
    obj.edit2:setField("bonusHabilidades");
    obj.edit2:setWidth(70);
    obj.edit2:setName("edit2");
    obj.edit2:setTransparent(true);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(15);
    obj.edit2:setFontColor("white");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("client");
    obj.label2:setText("@@DnD5e.frente.lab.abilityBonus");
    obj.label2:setMargins({left=10});
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");
    obj.label2:setFontSize(12);
    obj.label2:setFontColor("#D0D0D0");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setMinWidth(280);
    obj.flowPart3:setMaxWidth(800);
    obj.flowPart3:setHeight(64);
    obj.flowPart3:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart3:setVertAlign("leading");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("left");
    obj.edit3:setField("bonusResistencias");
    obj.edit3:setWidth(70);
    obj.edit3:setName("edit3");
    obj.edit3:setTransparent(true);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(15);
    obj.edit3:setFontColor("white");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("client");
    obj.label3:setText("@@DnD5e.frente.lab.saveBonus");
    obj.label3:setMargins({left=10});
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");
    obj.label3:setFontSize(12);
    obj.label3:setFontColor("#D0D0D0");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout2);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout2);
    obj.flowPart4:setMinWidth(280);
    obj.flowPart4:setMaxWidth(800);
    obj.flowPart4:setHeight(64);
    obj.flowPart4:setFrameStyle("frames/posCaptionEdit1/frame.xml");
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart4:setVertAlign("leading");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart4);
    obj.edit4:setAlign("left");
    obj.edit4:setField("inspiracao");
    obj.edit4:setWidth(65);
    obj.edit4:setName("edit4");
    obj.edit4:setTransparent(true);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(15);
    obj.edit4:setFontColor("white");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("client");
    obj.label4:setText("@@DnD5e.frente.lab.inspiration");
    obj.label4:setMargins({left=10});
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");
    obj.label4:setFontSize(12);
    obj.label4:setFontColor("#D0D0D0");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout2);
    obj.flowPart5:setMinWidth(280);
    obj.flowPart5:setMaxWidth(800);
    obj.flowPart5:setHeight(64);
    obj.flowPart5:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart5:setVertAlign("leading");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart5);
    obj.edit5:setAlign("left");
    obj.edit5:setField("sabedoriaPassiva");
    obj.edit5:setWidth(70);
    obj.edit5:setName("edit5");
    obj.edit5:setTransparent(true);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(15);
    obj.edit5:setFontColor("white");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart5);
    obj.label5:setAlign("client");
    obj.label5:setText("@@DnD5e.frente.lab.passivawisdom");
    obj.label5:setTextTrimming("none");
    obj.label5:setWordWrap(true);
    obj.label5:setMargins({left=10});
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");
    obj.label5:setFontSize(12);
    obj.label5:setFontColor("#D0D0D0");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.fraFrenteLayout);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMinScaledWidth(290);
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout3:setVertAlign("leading");

    obj.fraLayAtributos = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraLayAtributos:setParent(obj.flowLayout3);
    obj.fraLayAtributos:setName("fraLayAtributos");
    obj.fraLayAtributos:setVertAlign("leading");
    obj.fraLayAtributos:setAutoHeight(true);
    obj.fraLayAtributos:setMinScaledWidth(290);
    obj.fraLayAtributos:setMaxControlsPerLine(3);
    obj.fraLayAtributos:setHorzAlign("center");
    obj.fraLayAtributos:setLineSpacing(10);
    obj.fraLayAtributos:setFrameStyle("frames/panel1/frame.xml");
    obj.fraLayAtributos:setMargins({left=2, top=2, right=16, bottom=4});
    obj.fraLayAtributos:setAvoidScale(true);
    obj.fraLayAtributos:setStepSizes({310, 420, 640, 760, 900, 1150, 1200});

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.fraLayAtributos);
    obj.dataLink1:setField("atributos.forca");
    obj.dataLink1:setName("dataLink1");


			if self.__attrSortData == nil then
				self.__attrSortData = {};
			end;
			
			self.__attrSortData.forca = {};
		


    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.fraLayAtributos);
    obj.flowPart6:setHeight(140);
    obj.flowPart6:setMinWidth(320);
    obj.flowPart6:setMaxWidth(420);
    obj.flowPart6:setMinScaledWidth(305);
    obj.flowPart6:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart6:setVertAlign("leading");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart6);
    obj.layout1:setLeft(6);
    obj.layout1:setTop(12);
    obj.layout1:setWidth(116);
    obj.layout1:setHeight(115);
    obj.layout1:setName("layout1");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6:setAlign("top");
    obj.edit6:setMargins({left=30, right=30});
    obj.edit6:setField("atributos.forca");
    obj.edit6:setHeight(30);
    obj.edit6:setType("number");
    obj.edit6:setMin(0);
    obj.edit6:setMax(99);
    obj.edit6:setName("edit6");
    obj.edit6:setTransparent(true);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontSize(15);
    obj.edit6:setFontColor("white");

    obj.modforcastr = GUI.fromHandle(_obj_newObject("label"));
    obj.modforcastr:setParent(obj.flowPart6);
    obj.modforcastr:setFrameRegion("modificador");
    obj.modforcastr:setName("modforcastr");
    obj.modforcastr:setField("atributos.modforcastr");
    obj.modforcastr:setHorzTextAlign("center");
    obj.modforcastr:setVertTextAlign("center");
    obj.modforcastr:setFontSize(46);
    lfm_setPropAsString(obj.modforcastr, "fontStyle", "bold");
    obj.modforcastr:setFontColor("white");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart6);
    obj.layout2:setFrameRegion("titulo");
    obj.layout2:setName("layout2");

    obj.modforcabutton = GUI.fromHandle(_obj_newObject("button"));
    obj.modforcabutton:setParent(obj.layout2);
    obj.modforcabutton:setAlign("client");
    obj.modforcabutton:setName("modforcabutton");
    obj.modforcabutton:setText("@@DnD5e.frente.box.strength");
    obj.modforcabutton:setVertTextAlign("center");
    obj.modforcabutton:setHorzTextAlign("center");
    obj.modforcabutton:setMargins({left=10,right=10});
    obj.modforcabutton:setFontSize(12);

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowPart6);
    obj.flowLayout4:setFrameRegion("RegiaoDePericias");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setLineSpacing(0);
    obj.flowLayout4:setHorzAlign("leading");
    obj.flowLayout4:setName("flowLayout4");
    obj.flowLayout4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout4:setVertAlign("leading");

    obj.flpSkillFlowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart1:setParent(obj.flowLayout4);
    obj.flpSkillFlowPart1:setMinWidth(206);
    obj.flpSkillFlowPart1:setMaxWidth(250);
    obj.flpSkillFlowPart1:setHeight(17);
    obj.flpSkillFlowPart1:setName("flpSkillFlowPart1");
    obj.flpSkillFlowPart1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart1:setVertAlign("leading");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.flpSkillFlowPart1);
    obj.image1:setAlign("left");
    obj.image1:setWidth(20);
    obj.image1:setHeight(20);
    obj.image1:setMargins({});
    obj.image1:setName("image1");
    obj.image1:setField("resistencias.forcaIcon");
    obj.image1:setStyle("proportional");
    obj.image1:setHitTest(true);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.flpSkillFlowPart1);
    obj.dataLink2:setField("resistencias.forcaIcon");
    obj.dataLink2:setDefaultValue("http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.flpSkillFlowPart1);
    obj.dataLink3:setField("resistencias.forca");
    obj.dataLink3:setName("dataLink3");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flpSkillFlowPart1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(26);
    obj.layout3:setMargins({left=2});
    obj.layout3:setHitTest(true);
    obj.layout3:setName("layout3");

    obj.flpSkillFlowPart1str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart1str:setParent(obj.layout3);
    obj.flpSkillFlowPart1str:setName("flpSkillFlowPart1str");
    obj.flpSkillFlowPart1str:setField("resistencias.bonusforcastr");
    obj.flpSkillFlowPart1str:setAlign("client");
    obj.flpSkillFlowPart1str:setHorzTextAlign("center");
    obj.flpSkillFlowPart1str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart1str:setTextTrimming("none");
    obj.flpSkillFlowPart1str:setFontColor("white");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout3);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setName("horzLine1");

    obj.flpSkillFlowPart1button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart1button:setParent(obj.flpSkillFlowPart1);
    obj.flpSkillFlowPart1button:setName("flpSkillFlowPart1button");
    obj.flpSkillFlowPart1button:setAlign("left");
    obj.flpSkillFlowPart1button:setText("@@DnD5e.savingThrows.title");
    obj.flpSkillFlowPart1button:setWidth(122);
    obj.flpSkillFlowPart1button:setMargins({left=2});
    obj.flpSkillFlowPart1button:setFontSize(12);

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.flowLayout4);
    obj.dataLink4:setFields({'atributos.modforca', 'bonusProficiencia', 'resistencias.forca', 'resistencias.forcastrAltAtr', 'bonusResistencias'});
    obj.dataLink4:setName("dataLink4");

    obj.flpSkillFlowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart2:setParent(obj.flowLayout4);
    obj.flpSkillFlowPart2:setMinWidth(206);
    obj.flpSkillFlowPart2:setMaxWidth(250);
    obj.flpSkillFlowPart2:setHeight(17);
    obj.flpSkillFlowPart2:setName("flpSkillFlowPart2");
    obj.flpSkillFlowPart2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart2:setVertAlign("leading");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.flpSkillFlowPart2);
    obj.image2:setAlign("left");
    obj.image2:setWidth(20);
    obj.image2:setHeight(20);
    obj.image2:setMargins({});
    obj.image2:setName("image2");
    obj.image2:setField("pericias.atletismoIcon");
    obj.image2:setStyle("proportional");
    obj.image2:setHitTest(true);

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.flpSkillFlowPart2);
    obj.dataLink5:setField("pericias.atletismoIcon");
    obj.dataLink5:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.flpSkillFlowPart2);
    obj.dataLink6:setField("pericias.atletismo");
    obj.dataLink6:setName("dataLink6");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flpSkillFlowPart2);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(26);
    obj.layout4:setMargins({left=2});
    obj.layout4:setHitTest(true);
    obj.layout4:setName("layout4");

    obj.flpSkillFlowPart2str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart2str:setParent(obj.layout4);
    obj.flpSkillFlowPart2str:setName("flpSkillFlowPart2str");
    obj.flpSkillFlowPart2str:setField("pericias.bonusatletismostr");
    obj.flpSkillFlowPart2str:setAlign("client");
    obj.flpSkillFlowPart2str:setHorzTextAlign("center");
    obj.flpSkillFlowPart2str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart2str:setTextTrimming("none");
    obj.flpSkillFlowPart2str:setFontColor("white");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout4);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setStrokeSize(1);
    obj.horzLine2:setAlign("bottom");
    obj.horzLine2:setName("horzLine2");

    obj.flpSkillFlowPart2button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart2button:setParent(obj.flpSkillFlowPart2);
    obj.flpSkillFlowPart2button:setName("flpSkillFlowPart2button");
    obj.flpSkillFlowPart2button:setAlign("left");
    obj.flpSkillFlowPart2button:setText("@@DnD5e.skills.athletics");
    obj.flpSkillFlowPart2button:setWidth(122);
    obj.flpSkillFlowPart2button:setMargins({left=2});
    obj.flpSkillFlowPart2button:setFontSize(12);


				table.insert(self.__attrSortData.forca, {title="@@DnD5e.skills.athletics", controlName="flpSkillFlowPart2"});				
			


    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.flowLayout4);
    obj.dataLink7:setFields({'atributos.modforca', 'bonusProficiencia', 'pericias.atletismo', 'pericias.bonusatletismostrAltAtr', 'bonusHabilidades'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.fraLayAtributos);
    obj.dataLink8:setField("atributos.destreza");
    obj.dataLink8:setName("dataLink8");


			if self.__attrSortData == nil then
				self.__attrSortData = {};
			end;
			
			self.__attrSortData.destreza = {};
		


    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.fraLayAtributos);
    obj.flowPart7:setHeight(140);
    obj.flowPart7:setMinWidth(320);
    obj.flowPart7:setMaxWidth(420);
    obj.flowPart7:setMinScaledWidth(305);
    obj.flowPart7:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart7:setVertAlign("leading");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart7);
    obj.layout5:setLeft(6);
    obj.layout5:setTop(12);
    obj.layout5:setWidth(116);
    obj.layout5:setHeight(115);
    obj.layout5:setName("layout5");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout5);
    obj.edit7:setAlign("top");
    obj.edit7:setMargins({left=30, right=30});
    obj.edit7:setField("atributos.destreza");
    obj.edit7:setHeight(30);
    obj.edit7:setType("number");
    obj.edit7:setMin(0);
    obj.edit7:setMax(99);
    obj.edit7:setName("edit7");
    obj.edit7:setTransparent(true);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(15);
    obj.edit7:setFontColor("white");

    obj.moddestrezastr = GUI.fromHandle(_obj_newObject("label"));
    obj.moddestrezastr:setParent(obj.flowPart7);
    obj.moddestrezastr:setFrameRegion("modificador");
    obj.moddestrezastr:setName("moddestrezastr");
    obj.moddestrezastr:setField("atributos.moddestrezastr");
    obj.moddestrezastr:setHorzTextAlign("center");
    obj.moddestrezastr:setVertTextAlign("center");
    obj.moddestrezastr:setFontSize(46);
    lfm_setPropAsString(obj.moddestrezastr, "fontStyle", "bold");
    obj.moddestrezastr:setFontColor("white");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.flowPart7);
    obj.layout6:setFrameRegion("titulo");
    obj.layout6:setName("layout6");

    obj.moddestrezabutton = GUI.fromHandle(_obj_newObject("button"));
    obj.moddestrezabutton:setParent(obj.layout6);
    obj.moddestrezabutton:setAlign("client");
    obj.moddestrezabutton:setName("moddestrezabutton");
    obj.moddestrezabutton:setText("@@DnD5e.frente.box.dexterity");
    obj.moddestrezabutton:setVertTextAlign("center");
    obj.moddestrezabutton:setHorzTextAlign("center");
    obj.moddestrezabutton:setMargins({left=10,right=10});
    obj.moddestrezabutton:setFontSize(12);

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.flowPart7);
    obj.flowLayout5:setFrameRegion("RegiaoDePericias");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setLineSpacing(0);
    obj.flowLayout5:setHorzAlign("leading");
    obj.flowLayout5:setName("flowLayout5");
    obj.flowLayout5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout5:setVertAlign("leading");

    obj.flpSkillFlowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart3:setParent(obj.flowLayout5);
    obj.flpSkillFlowPart3:setMinWidth(206);
    obj.flpSkillFlowPart3:setMaxWidth(250);
    obj.flpSkillFlowPart3:setHeight(17);
    obj.flpSkillFlowPart3:setName("flpSkillFlowPart3");
    obj.flpSkillFlowPart3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart3:setVertAlign("leading");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.flpSkillFlowPart3);
    obj.image3:setAlign("left");
    obj.image3:setWidth(20);
    obj.image3:setHeight(20);
    obj.image3:setMargins({});
    obj.image3:setName("image3");
    obj.image3:setField("resistencias.destrezaIcon");
    obj.image3:setStyle("proportional");
    obj.image3:setHitTest(true);

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.flpSkillFlowPart3);
    obj.dataLink9:setField("resistencias.destrezaIcon");
    obj.dataLink9:setDefaultValue("http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.flpSkillFlowPart3);
    obj.dataLink10:setField("resistencias.destreza");
    obj.dataLink10:setName("dataLink10");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.flpSkillFlowPart3);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(26);
    obj.layout7:setMargins({left=2});
    obj.layout7:setHitTest(true);
    obj.layout7:setName("layout7");

    obj.flpSkillFlowPart3str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart3str:setParent(obj.layout7);
    obj.flpSkillFlowPart3str:setName("flpSkillFlowPart3str");
    obj.flpSkillFlowPart3str:setField("resistencias.bonusdestrezastr");
    obj.flpSkillFlowPart3str:setAlign("client");
    obj.flpSkillFlowPart3str:setHorzTextAlign("center");
    obj.flpSkillFlowPart3str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart3str:setTextTrimming("none");
    obj.flpSkillFlowPart3str:setFontColor("white");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout7);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setStrokeSize(1);
    obj.horzLine3:setAlign("bottom");
    obj.horzLine3:setName("horzLine3");

    obj.flpSkillFlowPart3button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart3button:setParent(obj.flpSkillFlowPart3);
    obj.flpSkillFlowPart3button:setName("flpSkillFlowPart3button");
    obj.flpSkillFlowPart3button:setAlign("left");
    obj.flpSkillFlowPart3button:setText("@@DnD5e.savingThrows.title");
    obj.flpSkillFlowPart3button:setWidth(122);
    obj.flpSkillFlowPart3button:setMargins({left=2});
    obj.flpSkillFlowPart3button:setFontSize(12);

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.flowLayout5);
    obj.dataLink11:setFields({'atributos.moddestreza', 'bonusProficiencia', 'resistencias.destreza', 'resistencias.destrezastrAltAtr', 'bonusResistencias'});
    obj.dataLink11:setName("dataLink11");

    obj.flpSkillFlowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart4:setParent(obj.flowLayout5);
    obj.flpSkillFlowPart4:setMinWidth(206);
    obj.flpSkillFlowPart4:setMaxWidth(250);
    obj.flpSkillFlowPart4:setHeight(17);
    obj.flpSkillFlowPart4:setName("flpSkillFlowPart4");
    obj.flpSkillFlowPart4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart4:setVertAlign("leading");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.flpSkillFlowPart4);
    obj.image4:setAlign("left");
    obj.image4:setWidth(20);
    obj.image4:setHeight(20);
    obj.image4:setMargins({});
    obj.image4:setName("image4");
    obj.image4:setField("pericias.acrobaciaIcon");
    obj.image4:setStyle("proportional");
    obj.image4:setHitTest(true);

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.flpSkillFlowPart4);
    obj.dataLink12:setField("pericias.acrobaciaIcon");
    obj.dataLink12:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.flpSkillFlowPart4);
    obj.dataLink13:setField("pericias.acrobacia");
    obj.dataLink13:setName("dataLink13");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.flpSkillFlowPart4);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(26);
    obj.layout8:setMargins({left=2});
    obj.layout8:setHitTest(true);
    obj.layout8:setName("layout8");

    obj.flpSkillFlowPart4str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart4str:setParent(obj.layout8);
    obj.flpSkillFlowPart4str:setName("flpSkillFlowPart4str");
    obj.flpSkillFlowPart4str:setField("pericias.bonusacrobaciastr");
    obj.flpSkillFlowPart4str:setAlign("client");
    obj.flpSkillFlowPart4str:setHorzTextAlign("center");
    obj.flpSkillFlowPart4str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart4str:setTextTrimming("none");
    obj.flpSkillFlowPart4str:setFontColor("white");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout8);
    obj.horzLine4:setStrokeColor("white");
    obj.horzLine4:setStrokeSize(1);
    obj.horzLine4:setAlign("bottom");
    obj.horzLine4:setName("horzLine4");

    obj.flpSkillFlowPart4button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart4button:setParent(obj.flpSkillFlowPart4);
    obj.flpSkillFlowPart4button:setName("flpSkillFlowPart4button");
    obj.flpSkillFlowPart4button:setAlign("left");
    obj.flpSkillFlowPart4button:setText("@@DnD5e.skills.acrobatics");
    obj.flpSkillFlowPart4button:setWidth(122);
    obj.flpSkillFlowPart4button:setMargins({left=2});
    obj.flpSkillFlowPart4button:setFontSize(12);


				table.insert(self.__attrSortData.destreza, {title="@@DnD5e.skills.acrobatics", controlName="flpSkillFlowPart4"});				
			


    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.flowLayout5);
    obj.dataLink14:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.acrobacia', 'pericias.bonusacrobaciastrAltAtr', 'bonusHabilidades'});
    obj.dataLink14:setName("dataLink14");

    obj.flpSkillFlowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart5:setParent(obj.flowLayout5);
    obj.flpSkillFlowPart5:setMinWidth(206);
    obj.flpSkillFlowPart5:setMaxWidth(250);
    obj.flpSkillFlowPart5:setHeight(17);
    obj.flpSkillFlowPart5:setName("flpSkillFlowPart5");
    obj.flpSkillFlowPart5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart5:setVertAlign("leading");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.flpSkillFlowPart5);
    obj.image5:setAlign("left");
    obj.image5:setWidth(20);
    obj.image5:setHeight(20);
    obj.image5:setMargins({});
    obj.image5:setName("image5");
    obj.image5:setField("pericias.furtividadeIcon");
    obj.image5:setStyle("proportional");
    obj.image5:setHitTest(true);

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.flpSkillFlowPart5);
    obj.dataLink15:setField("pericias.furtividadeIcon");
    obj.dataLink15:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.flpSkillFlowPart5);
    obj.dataLink16:setField("pericias.furtividade");
    obj.dataLink16:setName("dataLink16");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flpSkillFlowPart5);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(26);
    obj.layout9:setMargins({left=2});
    obj.layout9:setHitTest(true);
    obj.layout9:setName("layout9");

    obj.flpSkillFlowPart5str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart5str:setParent(obj.layout9);
    obj.flpSkillFlowPart5str:setName("flpSkillFlowPart5str");
    obj.flpSkillFlowPart5str:setField("pericias.bonusfurtividadestr");
    obj.flpSkillFlowPart5str:setAlign("client");
    obj.flpSkillFlowPart5str:setHorzTextAlign("center");
    obj.flpSkillFlowPart5str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart5str:setTextTrimming("none");
    obj.flpSkillFlowPart5str:setFontColor("white");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout9);
    obj.horzLine5:setStrokeColor("white");
    obj.horzLine5:setStrokeSize(1);
    obj.horzLine5:setAlign("bottom");
    obj.horzLine5:setName("horzLine5");

    obj.flpSkillFlowPart5button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart5button:setParent(obj.flpSkillFlowPart5);
    obj.flpSkillFlowPart5button:setName("flpSkillFlowPart5button");
    obj.flpSkillFlowPart5button:setAlign("left");
    obj.flpSkillFlowPart5button:setText("@@DnD5e.skills.stealth");
    obj.flpSkillFlowPart5button:setWidth(122);
    obj.flpSkillFlowPart5button:setMargins({left=2});
    obj.flpSkillFlowPart5button:setFontSize(12);


				table.insert(self.__attrSortData.destreza, {title="@@DnD5e.skills.stealth", controlName="flpSkillFlowPart5"});				
			


    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.flowLayout5);
    obj.dataLink17:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.furtividade', 'pericias.bonusfurtividadestrAltAtr', 'bonusHabilidades'});
    obj.dataLink17:setName("dataLink17");

    obj.flpSkillFlowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart6:setParent(obj.flowLayout5);
    obj.flpSkillFlowPart6:setMinWidth(206);
    obj.flpSkillFlowPart6:setMaxWidth(250);
    obj.flpSkillFlowPart6:setHeight(17);
    obj.flpSkillFlowPart6:setName("flpSkillFlowPart6");
    obj.flpSkillFlowPart6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart6:setVertAlign("leading");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.flpSkillFlowPart6);
    obj.image6:setAlign("left");
    obj.image6:setWidth(20);
    obj.image6:setHeight(20);
    obj.image6:setMargins({});
    obj.image6:setName("image6");
    obj.image6:setField("pericias.prestidigitacaoIcon");
    obj.image6:setStyle("proportional");
    obj.image6:setHitTest(true);

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.flpSkillFlowPart6);
    obj.dataLink18:setField("pericias.prestidigitacaoIcon");
    obj.dataLink18:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink18:setName("dataLink18");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.flpSkillFlowPart6);
    obj.dataLink19:setField("pericias.prestidigitacao");
    obj.dataLink19:setName("dataLink19");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.flpSkillFlowPart6);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(26);
    obj.layout10:setMargins({left=2});
    obj.layout10:setHitTest(true);
    obj.layout10:setName("layout10");

    obj.flpSkillFlowPart6str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart6str:setParent(obj.layout10);
    obj.flpSkillFlowPart6str:setName("flpSkillFlowPart6str");
    obj.flpSkillFlowPart6str:setField("pericias.bonusprestidigitacaostr");
    obj.flpSkillFlowPart6str:setAlign("client");
    obj.flpSkillFlowPart6str:setHorzTextAlign("center");
    obj.flpSkillFlowPart6str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart6str:setTextTrimming("none");
    obj.flpSkillFlowPart6str:setFontColor("white");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout10);
    obj.horzLine6:setStrokeColor("white");
    obj.horzLine6:setStrokeSize(1);
    obj.horzLine6:setAlign("bottom");
    obj.horzLine6:setName("horzLine6");

    obj.flpSkillFlowPart6button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart6button:setParent(obj.flpSkillFlowPart6);
    obj.flpSkillFlowPart6button:setName("flpSkillFlowPart6button");
    obj.flpSkillFlowPart6button:setAlign("left");
    obj.flpSkillFlowPart6button:setText("@@DnD5e.skills.sleighthand");
    obj.flpSkillFlowPart6button:setWidth(122);
    obj.flpSkillFlowPart6button:setMargins({left=2});
    obj.flpSkillFlowPart6button:setFontSize(12);


				table.insert(self.__attrSortData.destreza, {title="@@DnD5e.skills.sleighthand", controlName="flpSkillFlowPart6"});				
			


    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.flowLayout5);
    obj.dataLink20:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.prestidigitacao', 'pericias.bonusprestidigitacaostrAltAtr', 'bonusHabilidades'});
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.fraLayAtributos);
    obj.dataLink21:setField("atributos.constituicao");
    obj.dataLink21:setName("dataLink21");


			if self.__attrSortData == nil then
				self.__attrSortData = {};
			end;
			
			self.__attrSortData.constituicao = {};
		


    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.fraLayAtributos);
    obj.flowPart8:setHeight(140);
    obj.flowPart8:setMinWidth(320);
    obj.flowPart8:setMaxWidth(420);
    obj.flowPart8:setMinScaledWidth(305);
    obj.flowPart8:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart8:setVertAlign("leading");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart8);
    obj.layout11:setLeft(6);
    obj.layout11:setTop(12);
    obj.layout11:setWidth(116);
    obj.layout11:setHeight(115);
    obj.layout11:setName("layout11");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout11);
    obj.edit8:setAlign("top");
    obj.edit8:setMargins({left=30, right=30});
    obj.edit8:setField("atributos.constituicao");
    obj.edit8:setHeight(30);
    obj.edit8:setType("number");
    obj.edit8:setMin(0);
    obj.edit8:setMax(99);
    obj.edit8:setName("edit8");
    obj.edit8:setTransparent(true);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(15);
    obj.edit8:setFontColor("white");

    obj.modconstituicaostr = GUI.fromHandle(_obj_newObject("label"));
    obj.modconstituicaostr:setParent(obj.flowPart8);
    obj.modconstituicaostr:setFrameRegion("modificador");
    obj.modconstituicaostr:setName("modconstituicaostr");
    obj.modconstituicaostr:setField("atributos.modconstituicaostr");
    obj.modconstituicaostr:setHorzTextAlign("center");
    obj.modconstituicaostr:setVertTextAlign("center");
    obj.modconstituicaostr:setFontSize(46);
    lfm_setPropAsString(obj.modconstituicaostr, "fontStyle", "bold");
    obj.modconstituicaostr:setFontColor("white");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowPart8);
    obj.layout12:setFrameRegion("titulo");
    obj.layout12:setName("layout12");

    obj.modconstituicaobutton = GUI.fromHandle(_obj_newObject("button"));
    obj.modconstituicaobutton:setParent(obj.layout12);
    obj.modconstituicaobutton:setAlign("client");
    obj.modconstituicaobutton:setName("modconstituicaobutton");
    obj.modconstituicaobutton:setText("@@DnD5e.frente.box.constitution");
    obj.modconstituicaobutton:setVertTextAlign("center");
    obj.modconstituicaobutton:setHorzTextAlign("center");
    obj.modconstituicaobutton:setMargins({left=10,right=10});
    obj.modconstituicaobutton:setFontSize(12);

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.flowPart8);
    obj.flowLayout6:setFrameRegion("RegiaoDePericias");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setLineSpacing(0);
    obj.flowLayout6:setHorzAlign("leading");
    obj.flowLayout6:setName("flowLayout6");
    obj.flowLayout6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout6:setVertAlign("leading");

    obj.flpSkillFlowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart7:setParent(obj.flowLayout6);
    obj.flpSkillFlowPart7:setMinWidth(206);
    obj.flpSkillFlowPart7:setMaxWidth(250);
    obj.flpSkillFlowPart7:setHeight(17);
    obj.flpSkillFlowPart7:setName("flpSkillFlowPart7");
    obj.flpSkillFlowPart7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart7:setVertAlign("leading");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.flpSkillFlowPart7);
    obj.image7:setAlign("left");
    obj.image7:setWidth(20);
    obj.image7:setHeight(20);
    obj.image7:setMargins({});
    obj.image7:setName("image7");
    obj.image7:setField("resistencias.constituicaoIcon");
    obj.image7:setStyle("proportional");
    obj.image7:setHitTest(true);

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.flpSkillFlowPart7);
    obj.dataLink22:setField("resistencias.constituicaoIcon");
    obj.dataLink22:setDefaultValue("http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png");
    obj.dataLink22:setName("dataLink22");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.flpSkillFlowPart7);
    obj.dataLink23:setField("resistencias.constituicao");
    obj.dataLink23:setName("dataLink23");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.flpSkillFlowPart7);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(26);
    obj.layout13:setMargins({left=2});
    obj.layout13:setHitTest(true);
    obj.layout13:setName("layout13");

    obj.flpSkillFlowPart7str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart7str:setParent(obj.layout13);
    obj.flpSkillFlowPart7str:setName("flpSkillFlowPart7str");
    obj.flpSkillFlowPart7str:setField("resistencias.bonusconstituicaostr");
    obj.flpSkillFlowPart7str:setAlign("client");
    obj.flpSkillFlowPart7str:setHorzTextAlign("center");
    obj.flpSkillFlowPart7str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart7str:setTextTrimming("none");
    obj.flpSkillFlowPart7str:setFontColor("white");

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout13);
    obj.horzLine7:setStrokeColor("white");
    obj.horzLine7:setStrokeSize(1);
    obj.horzLine7:setAlign("bottom");
    obj.horzLine7:setName("horzLine7");

    obj.flpSkillFlowPart7button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart7button:setParent(obj.flpSkillFlowPart7);
    obj.flpSkillFlowPart7button:setName("flpSkillFlowPart7button");
    obj.flpSkillFlowPart7button:setAlign("left");
    obj.flpSkillFlowPart7button:setText("@@DnD5e.savingThrows.title");
    obj.flpSkillFlowPart7button:setWidth(122);
    obj.flpSkillFlowPart7button:setMargins({left=2});
    obj.flpSkillFlowPart7button:setFontSize(12);

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.flowLayout6);
    obj.dataLink24:setFields({'atributos.modconstituicao', 'bonusProficiencia', 'resistencias.constituicao', 'resistencias.constituicaostrAltAtr', 'bonusResistencias'});
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.fraLayAtributos);
    obj.dataLink25:setField("atributos.inteligencia");
    obj.dataLink25:setName("dataLink25");


			if self.__attrSortData == nil then
				self.__attrSortData = {};
			end;
			
			self.__attrSortData.inteligencia = {};
		


    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.fraLayAtributos);
    obj.flowPart9:setHeight(140);
    obj.flowPart9:setMinWidth(320);
    obj.flowPart9:setMaxWidth(420);
    obj.flowPart9:setMinScaledWidth(305);
    obj.flowPart9:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart9:setVertAlign("leading");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.flowPart9);
    obj.layout14:setLeft(6);
    obj.layout14:setTop(12);
    obj.layout14:setWidth(116);
    obj.layout14:setHeight(115);
    obj.layout14:setName("layout14");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout14);
    obj.edit9:setAlign("top");
    obj.edit9:setMargins({left=30, right=30});
    obj.edit9:setField("atributos.inteligencia");
    obj.edit9:setHeight(30);
    obj.edit9:setType("number");
    obj.edit9:setMin(0);
    obj.edit9:setMax(99);
    obj.edit9:setName("edit9");
    obj.edit9:setTransparent(true);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(15);
    obj.edit9:setFontColor("white");

    obj.modinteligenciastr = GUI.fromHandle(_obj_newObject("label"));
    obj.modinteligenciastr:setParent(obj.flowPart9);
    obj.modinteligenciastr:setFrameRegion("modificador");
    obj.modinteligenciastr:setName("modinteligenciastr");
    obj.modinteligenciastr:setField("atributos.modinteligenciastr");
    obj.modinteligenciastr:setHorzTextAlign("center");
    obj.modinteligenciastr:setVertTextAlign("center");
    obj.modinteligenciastr:setFontSize(46);
    lfm_setPropAsString(obj.modinteligenciastr, "fontStyle", "bold");
    obj.modinteligenciastr:setFontColor("white");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.flowPart9);
    obj.layout15:setFrameRegion("titulo");
    obj.layout15:setName("layout15");

    obj.modinteligenciabutton = GUI.fromHandle(_obj_newObject("button"));
    obj.modinteligenciabutton:setParent(obj.layout15);
    obj.modinteligenciabutton:setAlign("client");
    obj.modinteligenciabutton:setName("modinteligenciabutton");
    obj.modinteligenciabutton:setText("@@DnD5e.frente.box.intelligence");
    obj.modinteligenciabutton:setVertTextAlign("center");
    obj.modinteligenciabutton:setHorzTextAlign("center");
    obj.modinteligenciabutton:setMargins({left=10,right=10});
    obj.modinteligenciabutton:setFontSize(12);

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.flowPart9);
    obj.flowLayout7:setFrameRegion("RegiaoDePericias");
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setLineSpacing(0);
    obj.flowLayout7:setHorzAlign("leading");
    obj.flowLayout7:setName("flowLayout7");
    obj.flowLayout7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout7:setVertAlign("leading");

    obj.flpSkillFlowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart8:setParent(obj.flowLayout7);
    obj.flpSkillFlowPart8:setMinWidth(206);
    obj.flpSkillFlowPart8:setMaxWidth(250);
    obj.flpSkillFlowPart8:setHeight(17);
    obj.flpSkillFlowPart8:setName("flpSkillFlowPart8");
    obj.flpSkillFlowPart8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart8:setVertAlign("leading");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.flpSkillFlowPart8);
    obj.image8:setAlign("left");
    obj.image8:setWidth(20);
    obj.image8:setHeight(20);
    obj.image8:setMargins({});
    obj.image8:setName("image8");
    obj.image8:setField("resistencias.inteligenciaIcon");
    obj.image8:setStyle("proportional");
    obj.image8:setHitTest(true);

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.flpSkillFlowPart8);
    obj.dataLink26:setField("resistencias.inteligenciaIcon");
    obj.dataLink26:setDefaultValue("http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png");
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.flpSkillFlowPart8);
    obj.dataLink27:setField("resistencias.inteligencia");
    obj.dataLink27:setName("dataLink27");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.flpSkillFlowPart8);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(26);
    obj.layout16:setMargins({left=2});
    obj.layout16:setHitTest(true);
    obj.layout16:setName("layout16");

    obj.flpSkillFlowPart8str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart8str:setParent(obj.layout16);
    obj.flpSkillFlowPart8str:setName("flpSkillFlowPart8str");
    obj.flpSkillFlowPart8str:setField("resistencias.bonusinteligenciastr");
    obj.flpSkillFlowPart8str:setAlign("client");
    obj.flpSkillFlowPart8str:setHorzTextAlign("center");
    obj.flpSkillFlowPart8str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart8str:setTextTrimming("none");
    obj.flpSkillFlowPart8str:setFontColor("white");

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout16);
    obj.horzLine8:setStrokeColor("white");
    obj.horzLine8:setStrokeSize(1);
    obj.horzLine8:setAlign("bottom");
    obj.horzLine8:setName("horzLine8");

    obj.flpSkillFlowPart8button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart8button:setParent(obj.flpSkillFlowPart8);
    obj.flpSkillFlowPart8button:setName("flpSkillFlowPart8button");
    obj.flpSkillFlowPart8button:setAlign("left");
    obj.flpSkillFlowPart8button:setText("@@DnD5e.savingThrows.title");
    obj.flpSkillFlowPart8button:setWidth(122);
    obj.flpSkillFlowPart8button:setMargins({left=2});
    obj.flpSkillFlowPart8button:setFontSize(12);

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.flowLayout7);
    obj.dataLink28:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'resistencias.inteligencia', 'resistencias.inteligenciastrAltAtr', 'bonusResistencias'});
    obj.dataLink28:setName("dataLink28");

    obj.flpSkillFlowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart9:setParent(obj.flowLayout7);
    obj.flpSkillFlowPart9:setMinWidth(206);
    obj.flpSkillFlowPart9:setMaxWidth(250);
    obj.flpSkillFlowPart9:setHeight(17);
    obj.flpSkillFlowPart9:setName("flpSkillFlowPart9");
    obj.flpSkillFlowPart9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart9:setVertAlign("leading");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.flpSkillFlowPart9);
    obj.image9:setAlign("left");
    obj.image9:setWidth(20);
    obj.image9:setHeight(20);
    obj.image9:setMargins({});
    obj.image9:setName("image9");
    obj.image9:setField("pericias.arcanismoIcon");
    obj.image9:setStyle("proportional");
    obj.image9:setHitTest(true);

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.flpSkillFlowPart9);
    obj.dataLink29:setField("pericias.arcanismoIcon");
    obj.dataLink29:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.flpSkillFlowPart9);
    obj.dataLink30:setField("pericias.arcanismo");
    obj.dataLink30:setName("dataLink30");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.flpSkillFlowPart9);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(26);
    obj.layout17:setMargins({left=2});
    obj.layout17:setHitTest(true);
    obj.layout17:setName("layout17");

    obj.flpSkillFlowPart9str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart9str:setParent(obj.layout17);
    obj.flpSkillFlowPart9str:setName("flpSkillFlowPart9str");
    obj.flpSkillFlowPart9str:setField("pericias.bonusarcanismostr");
    obj.flpSkillFlowPart9str:setAlign("client");
    obj.flpSkillFlowPart9str:setHorzTextAlign("center");
    obj.flpSkillFlowPart9str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart9str:setTextTrimming("none");
    obj.flpSkillFlowPart9str:setFontColor("white");

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout17);
    obj.horzLine9:setStrokeColor("white");
    obj.horzLine9:setStrokeSize(1);
    obj.horzLine9:setAlign("bottom");
    obj.horzLine9:setName("horzLine9");

    obj.flpSkillFlowPart9button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart9button:setParent(obj.flpSkillFlowPart9);
    obj.flpSkillFlowPart9button:setName("flpSkillFlowPart9button");
    obj.flpSkillFlowPart9button:setAlign("left");
    obj.flpSkillFlowPart9button:setText("@@DnD5e.skills.arcana");
    obj.flpSkillFlowPart9button:setWidth(122);
    obj.flpSkillFlowPart9button:setMargins({left=2});
    obj.flpSkillFlowPart9button:setFontSize(12);


				table.insert(self.__attrSortData.inteligencia, {title="@@DnD5e.skills.arcana", controlName="flpSkillFlowPart9"});				
			


    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.flowLayout7);
    obj.dataLink31:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.arcanismo', 'pericias.bonusarcanismostrAltAtr', 'bonusHabilidades'});
    obj.dataLink31:setName("dataLink31");

    obj.flpSkillFlowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart10:setParent(obj.flowLayout7);
    obj.flpSkillFlowPart10:setMinWidth(206);
    obj.flpSkillFlowPart10:setMaxWidth(250);
    obj.flpSkillFlowPart10:setHeight(17);
    obj.flpSkillFlowPart10:setName("flpSkillFlowPart10");
    obj.flpSkillFlowPart10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart10:setVertAlign("leading");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.flpSkillFlowPart10);
    obj.image10:setAlign("left");
    obj.image10:setWidth(20);
    obj.image10:setHeight(20);
    obj.image10:setMargins({});
    obj.image10:setName("image10");
    obj.image10:setField("pericias.historiaIcon");
    obj.image10:setStyle("proportional");
    obj.image10:setHitTest(true);

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.flpSkillFlowPart10);
    obj.dataLink32:setField("pericias.historiaIcon");
    obj.dataLink32:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.flpSkillFlowPart10);
    obj.dataLink33:setField("pericias.historia");
    obj.dataLink33:setName("dataLink33");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.flpSkillFlowPart10);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(26);
    obj.layout18:setMargins({left=2});
    obj.layout18:setHitTest(true);
    obj.layout18:setName("layout18");

    obj.flpSkillFlowPart10str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart10str:setParent(obj.layout18);
    obj.flpSkillFlowPart10str:setName("flpSkillFlowPart10str");
    obj.flpSkillFlowPart10str:setField("pericias.bonushistoriastr");
    obj.flpSkillFlowPart10str:setAlign("client");
    obj.flpSkillFlowPart10str:setHorzTextAlign("center");
    obj.flpSkillFlowPart10str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart10str:setTextTrimming("none");
    obj.flpSkillFlowPart10str:setFontColor("white");

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.layout18);
    obj.horzLine10:setStrokeColor("white");
    obj.horzLine10:setStrokeSize(1);
    obj.horzLine10:setAlign("bottom");
    obj.horzLine10:setName("horzLine10");

    obj.flpSkillFlowPart10button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart10button:setParent(obj.flpSkillFlowPart10);
    obj.flpSkillFlowPart10button:setName("flpSkillFlowPart10button");
    obj.flpSkillFlowPart10button:setAlign("left");
    obj.flpSkillFlowPart10button:setText("@@DnD5e.skills.history");
    obj.flpSkillFlowPart10button:setWidth(122);
    obj.flpSkillFlowPart10button:setMargins({left=2});
    obj.flpSkillFlowPart10button:setFontSize(12);


				table.insert(self.__attrSortData.inteligencia, {title="@@DnD5e.skills.history", controlName="flpSkillFlowPart10"});				
			


    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.flowLayout7);
    obj.dataLink34:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.historia', 'pericias.bonushistoriastrAltAtr', 'bonusHabilidades'});
    obj.dataLink34:setName("dataLink34");

    obj.flpSkillFlowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart11:setParent(obj.flowLayout7);
    obj.flpSkillFlowPart11:setMinWidth(206);
    obj.flpSkillFlowPart11:setMaxWidth(250);
    obj.flpSkillFlowPart11:setHeight(17);
    obj.flpSkillFlowPart11:setName("flpSkillFlowPart11");
    obj.flpSkillFlowPart11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart11:setVertAlign("leading");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.flpSkillFlowPart11);
    obj.image11:setAlign("left");
    obj.image11:setWidth(20);
    obj.image11:setHeight(20);
    obj.image11:setMargins({});
    obj.image11:setName("image11");
    obj.image11:setField("pericias.investigacaoIcon");
    obj.image11:setStyle("proportional");
    obj.image11:setHitTest(true);

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.flpSkillFlowPart11);
    obj.dataLink35:setField("pericias.investigacaoIcon");
    obj.dataLink35:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.flpSkillFlowPart11);
    obj.dataLink36:setField("pericias.investigacao");
    obj.dataLink36:setName("dataLink36");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.flpSkillFlowPart11);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(26);
    obj.layout19:setMargins({left=2});
    obj.layout19:setHitTest(true);
    obj.layout19:setName("layout19");

    obj.flpSkillFlowPart11str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart11str:setParent(obj.layout19);
    obj.flpSkillFlowPart11str:setName("flpSkillFlowPart11str");
    obj.flpSkillFlowPart11str:setField("pericias.bonusinvestigacaostr");
    obj.flpSkillFlowPart11str:setAlign("client");
    obj.flpSkillFlowPart11str:setHorzTextAlign("center");
    obj.flpSkillFlowPart11str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart11str:setTextTrimming("none");
    obj.flpSkillFlowPart11str:setFontColor("white");

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.layout19);
    obj.horzLine11:setStrokeColor("white");
    obj.horzLine11:setStrokeSize(1);
    obj.horzLine11:setAlign("bottom");
    obj.horzLine11:setName("horzLine11");

    obj.flpSkillFlowPart11button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart11button:setParent(obj.flpSkillFlowPart11);
    obj.flpSkillFlowPart11button:setName("flpSkillFlowPart11button");
    obj.flpSkillFlowPart11button:setAlign("left");
    obj.flpSkillFlowPart11button:setText("@@DnD5e.skills.investigation");
    obj.flpSkillFlowPart11button:setWidth(122);
    obj.flpSkillFlowPart11button:setMargins({left=2});
    obj.flpSkillFlowPart11button:setFontSize(12);


				table.insert(self.__attrSortData.inteligencia, {title="@@DnD5e.skills.investigation", controlName="flpSkillFlowPart11"});				
			


    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.flowLayout7);
    obj.dataLink37:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.investigacao', 'pericias.bonusinvestigacaostrAltAtr', 'bonusHabilidades'});
    obj.dataLink37:setName("dataLink37");

    obj.flpSkillFlowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart12:setParent(obj.flowLayout7);
    obj.flpSkillFlowPart12:setMinWidth(206);
    obj.flpSkillFlowPart12:setMaxWidth(250);
    obj.flpSkillFlowPart12:setHeight(17);
    obj.flpSkillFlowPart12:setName("flpSkillFlowPart12");
    obj.flpSkillFlowPart12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart12:setVertAlign("leading");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.flpSkillFlowPart12);
    obj.image12:setAlign("left");
    obj.image12:setWidth(20);
    obj.image12:setHeight(20);
    obj.image12:setMargins({});
    obj.image12:setName("image12");
    obj.image12:setField("pericias.naturezaIcon");
    obj.image12:setStyle("proportional");
    obj.image12:setHitTest(true);

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.flpSkillFlowPart12);
    obj.dataLink38:setField("pericias.naturezaIcon");
    obj.dataLink38:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.flpSkillFlowPart12);
    obj.dataLink39:setField("pericias.natureza");
    obj.dataLink39:setName("dataLink39");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.flpSkillFlowPart12);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(26);
    obj.layout20:setMargins({left=2});
    obj.layout20:setHitTest(true);
    obj.layout20:setName("layout20");

    obj.flpSkillFlowPart12str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart12str:setParent(obj.layout20);
    obj.flpSkillFlowPart12str:setName("flpSkillFlowPart12str");
    obj.flpSkillFlowPart12str:setField("pericias.bonusnaturezastr");
    obj.flpSkillFlowPart12str:setAlign("client");
    obj.flpSkillFlowPart12str:setHorzTextAlign("center");
    obj.flpSkillFlowPart12str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart12str:setTextTrimming("none");
    obj.flpSkillFlowPart12str:setFontColor("white");

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.layout20);
    obj.horzLine12:setStrokeColor("white");
    obj.horzLine12:setStrokeSize(1);
    obj.horzLine12:setAlign("bottom");
    obj.horzLine12:setName("horzLine12");

    obj.flpSkillFlowPart12button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart12button:setParent(obj.flpSkillFlowPart12);
    obj.flpSkillFlowPart12button:setName("flpSkillFlowPart12button");
    obj.flpSkillFlowPart12button:setAlign("left");
    obj.flpSkillFlowPart12button:setText("@@DnD5e.skills.nature");
    obj.flpSkillFlowPart12button:setWidth(122);
    obj.flpSkillFlowPart12button:setMargins({left=2});
    obj.flpSkillFlowPart12button:setFontSize(12);


				table.insert(self.__attrSortData.inteligencia, {title="@@DnD5e.skills.nature", controlName="flpSkillFlowPart12"});				
			


    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.flowLayout7);
    obj.dataLink40:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.natureza', 'pericias.bonusnaturezastrAltAtr', 'bonusHabilidades'});
    obj.dataLink40:setName("dataLink40");

    obj.flpSkillFlowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart13:setParent(obj.flowLayout7);
    obj.flpSkillFlowPart13:setMinWidth(206);
    obj.flpSkillFlowPart13:setMaxWidth(250);
    obj.flpSkillFlowPart13:setHeight(17);
    obj.flpSkillFlowPart13:setName("flpSkillFlowPart13");
    obj.flpSkillFlowPart13:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart13:setVertAlign("leading");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.flpSkillFlowPart13);
    obj.image13:setAlign("left");
    obj.image13:setWidth(20);
    obj.image13:setHeight(20);
    obj.image13:setMargins({});
    obj.image13:setName("image13");
    obj.image13:setField("pericias.religiaoIcon");
    obj.image13:setStyle("proportional");
    obj.image13:setHitTest(true);

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.flpSkillFlowPart13);
    obj.dataLink41:setField("pericias.religiaoIcon");
    obj.dataLink41:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.flpSkillFlowPart13);
    obj.dataLink42:setField("pericias.religiao");
    obj.dataLink42:setName("dataLink42");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.flpSkillFlowPart13);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(26);
    obj.layout21:setMargins({left=2});
    obj.layout21:setHitTest(true);
    obj.layout21:setName("layout21");

    obj.flpSkillFlowPart13str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart13str:setParent(obj.layout21);
    obj.flpSkillFlowPart13str:setName("flpSkillFlowPart13str");
    obj.flpSkillFlowPart13str:setField("pericias.bonusreligiaostr");
    obj.flpSkillFlowPart13str:setAlign("client");
    obj.flpSkillFlowPart13str:setHorzTextAlign("center");
    obj.flpSkillFlowPart13str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart13str:setTextTrimming("none");
    obj.flpSkillFlowPart13str:setFontColor("white");

    obj.horzLine13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.layout21);
    obj.horzLine13:setStrokeColor("white");
    obj.horzLine13:setStrokeSize(1);
    obj.horzLine13:setAlign("bottom");
    obj.horzLine13:setName("horzLine13");

    obj.flpSkillFlowPart13button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart13button:setParent(obj.flpSkillFlowPart13);
    obj.flpSkillFlowPart13button:setName("flpSkillFlowPart13button");
    obj.flpSkillFlowPart13button:setAlign("left");
    obj.flpSkillFlowPart13button:setText("@@DnD5e.skills.religion");
    obj.flpSkillFlowPart13button:setWidth(122);
    obj.flpSkillFlowPart13button:setMargins({left=2});
    obj.flpSkillFlowPart13button:setFontSize(12);


				table.insert(self.__attrSortData.inteligencia, {title="@@DnD5e.skills.religion", controlName="flpSkillFlowPart13"});				
			


    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.flowLayout7);
    obj.dataLink43:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.religiao', 'pericias.bonusreligiaostrAltAtr', 'bonusHabilidades'});
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.fraLayAtributos);
    obj.dataLink44:setField("atributos.sabedoria");
    obj.dataLink44:setName("dataLink44");


			if self.__attrSortData == nil then
				self.__attrSortData = {};
			end;
			
			self.__attrSortData.sabedoria = {};
		


    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.fraLayAtributos);
    obj.flowPart10:setHeight(140);
    obj.flowPart10:setMinWidth(320);
    obj.flowPart10:setMaxWidth(420);
    obj.flowPart10:setMinScaledWidth(305);
    obj.flowPart10:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart10:setVertAlign("leading");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.flowPart10);
    obj.layout22:setLeft(6);
    obj.layout22:setTop(12);
    obj.layout22:setWidth(116);
    obj.layout22:setHeight(115);
    obj.layout22:setName("layout22");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout22);
    obj.edit10:setAlign("top");
    obj.edit10:setMargins({left=30, right=30});
    obj.edit10:setField("atributos.sabedoria");
    obj.edit10:setHeight(30);
    obj.edit10:setType("number");
    obj.edit10:setMin(0);
    obj.edit10:setMax(99);
    obj.edit10:setName("edit10");
    obj.edit10:setTransparent(true);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(15);
    obj.edit10:setFontColor("white");

    obj.modsabedoriastr = GUI.fromHandle(_obj_newObject("label"));
    obj.modsabedoriastr:setParent(obj.flowPart10);
    obj.modsabedoriastr:setFrameRegion("modificador");
    obj.modsabedoriastr:setName("modsabedoriastr");
    obj.modsabedoriastr:setField("atributos.modsabedoriastr");
    obj.modsabedoriastr:setHorzTextAlign("center");
    obj.modsabedoriastr:setVertTextAlign("center");
    obj.modsabedoriastr:setFontSize(46);
    lfm_setPropAsString(obj.modsabedoriastr, "fontStyle", "bold");
    obj.modsabedoriastr:setFontColor("white");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.flowPart10);
    obj.layout23:setFrameRegion("titulo");
    obj.layout23:setName("layout23");

    obj.modsabedoriabutton = GUI.fromHandle(_obj_newObject("button"));
    obj.modsabedoriabutton:setParent(obj.layout23);
    obj.modsabedoriabutton:setAlign("client");
    obj.modsabedoriabutton:setName("modsabedoriabutton");
    obj.modsabedoriabutton:setText("@@DnD5e.frente.box.wisdom");
    obj.modsabedoriabutton:setVertTextAlign("center");
    obj.modsabedoriabutton:setHorzTextAlign("center");
    obj.modsabedoriabutton:setMargins({left=10,right=10});
    obj.modsabedoriabutton:setFontSize(12);

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowPart10);
    obj.flowLayout8:setFrameRegion("RegiaoDePericias");
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setLineSpacing(0);
    obj.flowLayout8:setHorzAlign("leading");
    obj.flowLayout8:setName("flowLayout8");
    obj.flowLayout8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout8:setVertAlign("leading");

    obj.flpSkillFlowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart14:setParent(obj.flowLayout8);
    obj.flpSkillFlowPart14:setMinWidth(206);
    obj.flpSkillFlowPart14:setMaxWidth(250);
    obj.flpSkillFlowPart14:setHeight(17);
    obj.flpSkillFlowPart14:setName("flpSkillFlowPart14");
    obj.flpSkillFlowPart14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart14:setVertAlign("leading");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.flpSkillFlowPart14);
    obj.image14:setAlign("left");
    obj.image14:setWidth(20);
    obj.image14:setHeight(20);
    obj.image14:setMargins({});
    obj.image14:setName("image14");
    obj.image14:setField("resistencias.sabedoriaIcon");
    obj.image14:setStyle("proportional");
    obj.image14:setHitTest(true);

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.flpSkillFlowPart14);
    obj.dataLink45:setField("resistencias.sabedoriaIcon");
    obj.dataLink45:setDefaultValue("http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png");
    obj.dataLink45:setName("dataLink45");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.flpSkillFlowPart14);
    obj.dataLink46:setField("resistencias.sabedoria");
    obj.dataLink46:setName("dataLink46");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.flpSkillFlowPart14);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(26);
    obj.layout24:setMargins({left=2});
    obj.layout24:setHitTest(true);
    obj.layout24:setName("layout24");

    obj.flpSkillFlowPart14str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart14str:setParent(obj.layout24);
    obj.flpSkillFlowPart14str:setName("flpSkillFlowPart14str");
    obj.flpSkillFlowPart14str:setField("resistencias.bonussabedoriastr");
    obj.flpSkillFlowPart14str:setAlign("client");
    obj.flpSkillFlowPart14str:setHorzTextAlign("center");
    obj.flpSkillFlowPart14str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart14str:setTextTrimming("none");
    obj.flpSkillFlowPart14str:setFontColor("white");

    obj.horzLine14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.layout24);
    obj.horzLine14:setStrokeColor("white");
    obj.horzLine14:setStrokeSize(1);
    obj.horzLine14:setAlign("bottom");
    obj.horzLine14:setName("horzLine14");

    obj.flpSkillFlowPart14button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart14button:setParent(obj.flpSkillFlowPart14);
    obj.flpSkillFlowPart14button:setName("flpSkillFlowPart14button");
    obj.flpSkillFlowPart14button:setAlign("left");
    obj.flpSkillFlowPart14button:setText("@@DnD5e.savingThrows.title");
    obj.flpSkillFlowPart14button:setWidth(122);
    obj.flpSkillFlowPart14button:setMargins({left=2});
    obj.flpSkillFlowPart14button:setFontSize(12);

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.flowLayout8);
    obj.dataLink47:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'resistencias.sabedoria', 'resistencias.sabedoriastrAltAtr', 'bonusResistencias'});
    obj.dataLink47:setName("dataLink47");

    obj.flpSkillFlowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart15:setParent(obj.flowLayout8);
    obj.flpSkillFlowPart15:setMinWidth(206);
    obj.flpSkillFlowPart15:setMaxWidth(250);
    obj.flpSkillFlowPart15:setHeight(17);
    obj.flpSkillFlowPart15:setName("flpSkillFlowPart15");
    obj.flpSkillFlowPart15:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart15:setVertAlign("leading");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.flpSkillFlowPart15);
    obj.image15:setAlign("left");
    obj.image15:setWidth(20);
    obj.image15:setHeight(20);
    obj.image15:setMargins({});
    obj.image15:setName("image15");
    obj.image15:setField("pericias.adestrarAnimaisIcon");
    obj.image15:setStyle("proportional");
    obj.image15:setHitTest(true);

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.flpSkillFlowPart15);
    obj.dataLink48:setField("pericias.adestrarAnimaisIcon");
    obj.dataLink48:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink48:setName("dataLink48");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.flpSkillFlowPart15);
    obj.dataLink49:setField("pericias.adestrarAnimais");
    obj.dataLink49:setName("dataLink49");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.flpSkillFlowPart15);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(26);
    obj.layout25:setMargins({left=2});
    obj.layout25:setHitTest(true);
    obj.layout25:setName("layout25");

    obj.flpSkillFlowPart15str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart15str:setParent(obj.layout25);
    obj.flpSkillFlowPart15str:setName("flpSkillFlowPart15str");
    obj.flpSkillFlowPart15str:setField("pericias.bonusadestrarAnimaisstr");
    obj.flpSkillFlowPart15str:setAlign("client");
    obj.flpSkillFlowPart15str:setHorzTextAlign("center");
    obj.flpSkillFlowPart15str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart15str:setTextTrimming("none");
    obj.flpSkillFlowPart15str:setFontColor("white");

    obj.horzLine15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.layout25);
    obj.horzLine15:setStrokeColor("white");
    obj.horzLine15:setStrokeSize(1);
    obj.horzLine15:setAlign("bottom");
    obj.horzLine15:setName("horzLine15");

    obj.flpSkillFlowPart15button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart15button:setParent(obj.flpSkillFlowPart15);
    obj.flpSkillFlowPart15button:setName("flpSkillFlowPart15button");
    obj.flpSkillFlowPart15button:setAlign("left");
    obj.flpSkillFlowPart15button:setText("@@DnD5e.skills.animalhandling");
    obj.flpSkillFlowPart15button:setWidth(122);
    obj.flpSkillFlowPart15button:setMargins({left=2});
    obj.flpSkillFlowPart15button:setFontSize(12);


				table.insert(self.__attrSortData.sabedoria, {title="@@DnD5e.skills.animalhandling", controlName="flpSkillFlowPart15"});				
			


    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.flowLayout8);
    obj.dataLink50:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.adestrarAnimais', 'pericias.bonusadestrarAnimaisstrAltAtr', 'bonusHabilidades'});
    obj.dataLink50:setName("dataLink50");

    obj.flpSkillFlowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart16:setParent(obj.flowLayout8);
    obj.flpSkillFlowPart16:setMinWidth(206);
    obj.flpSkillFlowPart16:setMaxWidth(250);
    obj.flpSkillFlowPart16:setHeight(17);
    obj.flpSkillFlowPart16:setName("flpSkillFlowPart16");
    obj.flpSkillFlowPart16:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart16:setVertAlign("leading");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.flpSkillFlowPart16);
    obj.image16:setAlign("left");
    obj.image16:setWidth(20);
    obj.image16:setHeight(20);
    obj.image16:setMargins({});
    obj.image16:setName("image16");
    obj.image16:setField("pericias.intuicaoIcon");
    obj.image16:setStyle("proportional");
    obj.image16:setHitTest(true);

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.flpSkillFlowPart16);
    obj.dataLink51:setField("pericias.intuicaoIcon");
    obj.dataLink51:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink51:setName("dataLink51");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.flpSkillFlowPart16);
    obj.dataLink52:setField("pericias.intuicao");
    obj.dataLink52:setName("dataLink52");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.flpSkillFlowPart16);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(26);
    obj.layout26:setMargins({left=2});
    obj.layout26:setHitTest(true);
    obj.layout26:setName("layout26");

    obj.flpSkillFlowPart16str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart16str:setParent(obj.layout26);
    obj.flpSkillFlowPart16str:setName("flpSkillFlowPart16str");
    obj.flpSkillFlowPart16str:setField("pericias.bonusintuicaostr");
    obj.flpSkillFlowPart16str:setAlign("client");
    obj.flpSkillFlowPart16str:setHorzTextAlign("center");
    obj.flpSkillFlowPart16str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart16str:setTextTrimming("none");
    obj.flpSkillFlowPart16str:setFontColor("white");

    obj.horzLine16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.layout26);
    obj.horzLine16:setStrokeColor("white");
    obj.horzLine16:setStrokeSize(1);
    obj.horzLine16:setAlign("bottom");
    obj.horzLine16:setName("horzLine16");

    obj.flpSkillFlowPart16button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart16button:setParent(obj.flpSkillFlowPart16);
    obj.flpSkillFlowPart16button:setName("flpSkillFlowPart16button");
    obj.flpSkillFlowPart16button:setAlign("left");
    obj.flpSkillFlowPart16button:setText("@@DnD5e.skills.insight");
    obj.flpSkillFlowPart16button:setWidth(122);
    obj.flpSkillFlowPart16button:setMargins({left=2});
    obj.flpSkillFlowPart16button:setFontSize(12);


				table.insert(self.__attrSortData.sabedoria, {title="@@DnD5e.skills.insight", controlName="flpSkillFlowPart16"});				
			


    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.flowLayout8);
    obj.dataLink53:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.intuicao', 'pericias.bonusintuicaostrAltAtr', 'bonusHabilidades'});
    obj.dataLink53:setName("dataLink53");

    obj.flpSkillFlowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart17:setParent(obj.flowLayout8);
    obj.flpSkillFlowPart17:setMinWidth(206);
    obj.flpSkillFlowPart17:setMaxWidth(250);
    obj.flpSkillFlowPart17:setHeight(17);
    obj.flpSkillFlowPart17:setName("flpSkillFlowPart17");
    obj.flpSkillFlowPart17:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart17:setVertAlign("leading");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.flpSkillFlowPart17);
    obj.image17:setAlign("left");
    obj.image17:setWidth(20);
    obj.image17:setHeight(20);
    obj.image17:setMargins({});
    obj.image17:setName("image17");
    obj.image17:setField("pericias.medicinaIcon");
    obj.image17:setStyle("proportional");
    obj.image17:setHitTest(true);

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.flpSkillFlowPart17);
    obj.dataLink54:setField("pericias.medicinaIcon");
    obj.dataLink54:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.flpSkillFlowPart17);
    obj.dataLink55:setField("pericias.medicina");
    obj.dataLink55:setName("dataLink55");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.flpSkillFlowPart17);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(26);
    obj.layout27:setMargins({left=2});
    obj.layout27:setHitTest(true);
    obj.layout27:setName("layout27");

    obj.flpSkillFlowPart17str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart17str:setParent(obj.layout27);
    obj.flpSkillFlowPart17str:setName("flpSkillFlowPart17str");
    obj.flpSkillFlowPart17str:setField("pericias.bonusmedicinastr");
    obj.flpSkillFlowPart17str:setAlign("client");
    obj.flpSkillFlowPart17str:setHorzTextAlign("center");
    obj.flpSkillFlowPart17str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart17str:setTextTrimming("none");
    obj.flpSkillFlowPart17str:setFontColor("white");

    obj.horzLine17 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine17:setParent(obj.layout27);
    obj.horzLine17:setStrokeColor("white");
    obj.horzLine17:setStrokeSize(1);
    obj.horzLine17:setAlign("bottom");
    obj.horzLine17:setName("horzLine17");

    obj.flpSkillFlowPart17button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart17button:setParent(obj.flpSkillFlowPart17);
    obj.flpSkillFlowPart17button:setName("flpSkillFlowPart17button");
    obj.flpSkillFlowPart17button:setAlign("left");
    obj.flpSkillFlowPart17button:setText("@@DnD5e.skills.medicine");
    obj.flpSkillFlowPart17button:setWidth(122);
    obj.flpSkillFlowPart17button:setMargins({left=2});
    obj.flpSkillFlowPart17button:setFontSize(12);


				table.insert(self.__attrSortData.sabedoria, {title="@@DnD5e.skills.medicine", controlName="flpSkillFlowPart17"});				
			


    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.flowLayout8);
    obj.dataLink56:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.medicina', 'pericias.bonusmedicinastrAltAtr', 'bonusHabilidades'});
    obj.dataLink56:setName("dataLink56");

    obj.flpSkillFlowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart18:setParent(obj.flowLayout8);
    obj.flpSkillFlowPart18:setMinWidth(206);
    obj.flpSkillFlowPart18:setMaxWidth(250);
    obj.flpSkillFlowPart18:setHeight(17);
    obj.flpSkillFlowPart18:setName("flpSkillFlowPart18");
    obj.flpSkillFlowPart18:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart18:setVertAlign("leading");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.flpSkillFlowPart18);
    obj.image18:setAlign("left");
    obj.image18:setWidth(20);
    obj.image18:setHeight(20);
    obj.image18:setMargins({});
    obj.image18:setName("image18");
    obj.image18:setField("pericias.percepcaoIcon");
    obj.image18:setStyle("proportional");
    obj.image18:setHitTest(true);

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.flpSkillFlowPart18);
    obj.dataLink57:setField("pericias.percepcaoIcon");
    obj.dataLink57:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink57:setName("dataLink57");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.flpSkillFlowPart18);
    obj.dataLink58:setField("pericias.percepcao");
    obj.dataLink58:setName("dataLink58");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.flpSkillFlowPart18);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(26);
    obj.layout28:setMargins({left=2});
    obj.layout28:setHitTest(true);
    obj.layout28:setName("layout28");

    obj.flpSkillFlowPart18str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart18str:setParent(obj.layout28);
    obj.flpSkillFlowPart18str:setName("flpSkillFlowPart18str");
    obj.flpSkillFlowPart18str:setField("pericias.bonuspercepcaostr");
    obj.flpSkillFlowPart18str:setAlign("client");
    obj.flpSkillFlowPart18str:setHorzTextAlign("center");
    obj.flpSkillFlowPart18str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart18str:setTextTrimming("none");
    obj.flpSkillFlowPart18str:setFontColor("white");

    obj.horzLine18 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine18:setParent(obj.layout28);
    obj.horzLine18:setStrokeColor("white");
    obj.horzLine18:setStrokeSize(1);
    obj.horzLine18:setAlign("bottom");
    obj.horzLine18:setName("horzLine18");

    obj.flpSkillFlowPart18button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart18button:setParent(obj.flpSkillFlowPart18);
    obj.flpSkillFlowPart18button:setName("flpSkillFlowPart18button");
    obj.flpSkillFlowPart18button:setAlign("left");
    obj.flpSkillFlowPart18button:setText("@@DnD5e.skills.perception");
    obj.flpSkillFlowPart18button:setWidth(122);
    obj.flpSkillFlowPart18button:setMargins({left=2});
    obj.flpSkillFlowPart18button:setFontSize(12);


				table.insert(self.__attrSortData.sabedoria, {title="@@DnD5e.skills.perception", controlName="flpSkillFlowPart18"});				
			


    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.flowLayout8);
    obj.dataLink59:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.percepcao', 'pericias.bonuspercepcaostrAltAtr', 'bonusHabilidades'});
    obj.dataLink59:setName("dataLink59");

    obj.flpSkillFlowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart19:setParent(obj.flowLayout8);
    obj.flpSkillFlowPart19:setMinWidth(206);
    obj.flpSkillFlowPart19:setMaxWidth(250);
    obj.flpSkillFlowPart19:setHeight(17);
    obj.flpSkillFlowPart19:setName("flpSkillFlowPart19");
    obj.flpSkillFlowPart19:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart19:setVertAlign("leading");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.flpSkillFlowPart19);
    obj.image19:setAlign("left");
    obj.image19:setWidth(20);
    obj.image19:setHeight(20);
    obj.image19:setMargins({});
    obj.image19:setName("image19");
    obj.image19:setField("pericias.sobrevivenciaIcon");
    obj.image19:setStyle("proportional");
    obj.image19:setHitTest(true);

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.flpSkillFlowPart19);
    obj.dataLink60:setField("pericias.sobrevivenciaIcon");
    obj.dataLink60:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink60:setName("dataLink60");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.flpSkillFlowPart19);
    obj.dataLink61:setField("pericias.sobrevivencia");
    obj.dataLink61:setName("dataLink61");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.flpSkillFlowPart19);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(26);
    obj.layout29:setMargins({left=2});
    obj.layout29:setHitTest(true);
    obj.layout29:setName("layout29");

    obj.flpSkillFlowPart19str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart19str:setParent(obj.layout29);
    obj.flpSkillFlowPart19str:setName("flpSkillFlowPart19str");
    obj.flpSkillFlowPart19str:setField("pericias.bonussobrevivenciastr");
    obj.flpSkillFlowPart19str:setAlign("client");
    obj.flpSkillFlowPart19str:setHorzTextAlign("center");
    obj.flpSkillFlowPart19str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart19str:setTextTrimming("none");
    obj.flpSkillFlowPart19str:setFontColor("white");

    obj.horzLine19 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine19:setParent(obj.layout29);
    obj.horzLine19:setStrokeColor("white");
    obj.horzLine19:setStrokeSize(1);
    obj.horzLine19:setAlign("bottom");
    obj.horzLine19:setName("horzLine19");

    obj.flpSkillFlowPart19button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart19button:setParent(obj.flpSkillFlowPart19);
    obj.flpSkillFlowPart19button:setName("flpSkillFlowPart19button");
    obj.flpSkillFlowPart19button:setAlign("left");
    obj.flpSkillFlowPart19button:setText("@@DnD5e.skills.survival");
    obj.flpSkillFlowPart19button:setWidth(122);
    obj.flpSkillFlowPart19button:setMargins({left=2});
    obj.flpSkillFlowPart19button:setFontSize(12);


				table.insert(self.__attrSortData.sabedoria, {title="@@DnD5e.skills.survival", controlName="flpSkillFlowPart19"});				
			


    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.flowLayout8);
    obj.dataLink62:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.sobrevivencia', 'pericias.bonussobrevivenciastrAltAtr', 'bonusHabilidades'});
    obj.dataLink62:setName("dataLink62");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.fraLayAtributos);
    obj.dataLink63:setField("atributos.carisma");
    obj.dataLink63:setName("dataLink63");


			if self.__attrSortData == nil then
				self.__attrSortData = {};
			end;
			
			self.__attrSortData.carisma = {};
		


    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.fraLayAtributos);
    obj.flowPart11:setHeight(140);
    obj.flowPart11:setMinWidth(320);
    obj.flowPart11:setMaxWidth(420);
    obj.flowPart11:setMinScaledWidth(305);
    obj.flowPart11:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart11:setVertAlign("leading");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.flowPart11);
    obj.layout30:setLeft(6);
    obj.layout30:setTop(12);
    obj.layout30:setWidth(116);
    obj.layout30:setHeight(115);
    obj.layout30:setName("layout30");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout30);
    obj.edit11:setAlign("top");
    obj.edit11:setMargins({left=30, right=30});
    obj.edit11:setField("atributos.carisma");
    obj.edit11:setHeight(30);
    obj.edit11:setType("number");
    obj.edit11:setMin(0);
    obj.edit11:setMax(99);
    obj.edit11:setName("edit11");
    obj.edit11:setTransparent(true);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(15);
    obj.edit11:setFontColor("white");

    obj.modcarismastr = GUI.fromHandle(_obj_newObject("label"));
    obj.modcarismastr:setParent(obj.flowPart11);
    obj.modcarismastr:setFrameRegion("modificador");
    obj.modcarismastr:setName("modcarismastr");
    obj.modcarismastr:setField("atributos.modcarismastr");
    obj.modcarismastr:setHorzTextAlign("center");
    obj.modcarismastr:setVertTextAlign("center");
    obj.modcarismastr:setFontSize(46);
    lfm_setPropAsString(obj.modcarismastr, "fontStyle", "bold");
    obj.modcarismastr:setFontColor("white");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.flowPart11);
    obj.layout31:setFrameRegion("titulo");
    obj.layout31:setName("layout31");

    obj.modcarismabutton = GUI.fromHandle(_obj_newObject("button"));
    obj.modcarismabutton:setParent(obj.layout31);
    obj.modcarismabutton:setAlign("client");
    obj.modcarismabutton:setName("modcarismabutton");
    obj.modcarismabutton:setText("@@DnD5e.frente.box.charisma");
    obj.modcarismabutton:setVertTextAlign("center");
    obj.modcarismabutton:setHorzTextAlign("center");
    obj.modcarismabutton:setMargins({left=10,right=10});
    obj.modcarismabutton:setFontSize(12);

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.flowPart11);
    obj.flowLayout9:setFrameRegion("RegiaoDePericias");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setLineSpacing(0);
    obj.flowLayout9:setHorzAlign("leading");
    obj.flowLayout9:setName("flowLayout9");
    obj.flowLayout9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout9:setVertAlign("leading");

    obj.flpSkillFlowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart20:setParent(obj.flowLayout9);
    obj.flpSkillFlowPart20:setMinWidth(206);
    obj.flpSkillFlowPart20:setMaxWidth(250);
    obj.flpSkillFlowPart20:setHeight(17);
    obj.flpSkillFlowPart20:setName("flpSkillFlowPart20");
    obj.flpSkillFlowPart20:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart20:setVertAlign("leading");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.flpSkillFlowPart20);
    obj.image20:setAlign("left");
    obj.image20:setWidth(20);
    obj.image20:setHeight(20);
    obj.image20:setMargins({});
    obj.image20:setName("image20");
    obj.image20:setField("resistencias.carismaIcon");
    obj.image20:setStyle("proportional");
    obj.image20:setHitTest(true);

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.flpSkillFlowPart20);
    obj.dataLink64:setField("resistencias.carismaIcon");
    obj.dataLink64:setDefaultValue("http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png");
    obj.dataLink64:setName("dataLink64");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.flpSkillFlowPart20);
    obj.dataLink65:setField("resistencias.carisma");
    obj.dataLink65:setName("dataLink65");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.flpSkillFlowPart20);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(26);
    obj.layout32:setMargins({left=2});
    obj.layout32:setHitTest(true);
    obj.layout32:setName("layout32");

    obj.flpSkillFlowPart20str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart20str:setParent(obj.layout32);
    obj.flpSkillFlowPart20str:setName("flpSkillFlowPart20str");
    obj.flpSkillFlowPart20str:setField("resistencias.bonuscarismastr");
    obj.flpSkillFlowPart20str:setAlign("client");
    obj.flpSkillFlowPart20str:setHorzTextAlign("center");
    obj.flpSkillFlowPart20str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart20str:setTextTrimming("none");
    obj.flpSkillFlowPart20str:setFontColor("white");

    obj.horzLine20 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine20:setParent(obj.layout32);
    obj.horzLine20:setStrokeColor("white");
    obj.horzLine20:setStrokeSize(1);
    obj.horzLine20:setAlign("bottom");
    obj.horzLine20:setName("horzLine20");

    obj.flpSkillFlowPart20button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart20button:setParent(obj.flpSkillFlowPart20);
    obj.flpSkillFlowPart20button:setName("flpSkillFlowPart20button");
    obj.flpSkillFlowPart20button:setAlign("left");
    obj.flpSkillFlowPart20button:setText("@@DnD5e.savingThrows.title");
    obj.flpSkillFlowPart20button:setWidth(122);
    obj.flpSkillFlowPart20button:setMargins({left=2});
    obj.flpSkillFlowPart20button:setFontSize(12);

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.flowLayout9);
    obj.dataLink66:setFields({'atributos.modcarisma', 'bonusProficiencia', 'resistencias.carisma', 'resistencias.carismastrAltAtr', 'bonusResistencias'});
    obj.dataLink66:setName("dataLink66");

    obj.flpSkillFlowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart21:setParent(obj.flowLayout9);
    obj.flpSkillFlowPart21:setMinWidth(206);
    obj.flpSkillFlowPart21:setMaxWidth(250);
    obj.flpSkillFlowPart21:setHeight(17);
    obj.flpSkillFlowPart21:setName("flpSkillFlowPart21");
    obj.flpSkillFlowPart21:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart21:setVertAlign("leading");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.flpSkillFlowPart21);
    obj.image21:setAlign("left");
    obj.image21:setWidth(20);
    obj.image21:setHeight(20);
    obj.image21:setMargins({});
    obj.image21:setName("image21");
    obj.image21:setField("pericias.atuacaoIcon");
    obj.image21:setStyle("proportional");
    obj.image21:setHitTest(true);

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.flpSkillFlowPart21);
    obj.dataLink67:setField("pericias.atuacaoIcon");
    obj.dataLink67:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink67:setName("dataLink67");

    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.flpSkillFlowPart21);
    obj.dataLink68:setField("pericias.atuacao");
    obj.dataLink68:setName("dataLink68");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.flpSkillFlowPart21);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(26);
    obj.layout33:setMargins({left=2});
    obj.layout33:setHitTest(true);
    obj.layout33:setName("layout33");

    obj.flpSkillFlowPart21str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart21str:setParent(obj.layout33);
    obj.flpSkillFlowPart21str:setName("flpSkillFlowPart21str");
    obj.flpSkillFlowPart21str:setField("pericias.bonusatuacaostr");
    obj.flpSkillFlowPart21str:setAlign("client");
    obj.flpSkillFlowPart21str:setHorzTextAlign("center");
    obj.flpSkillFlowPart21str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart21str:setTextTrimming("none");
    obj.flpSkillFlowPart21str:setFontColor("white");

    obj.horzLine21 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine21:setParent(obj.layout33);
    obj.horzLine21:setStrokeColor("white");
    obj.horzLine21:setStrokeSize(1);
    obj.horzLine21:setAlign("bottom");
    obj.horzLine21:setName("horzLine21");

    obj.flpSkillFlowPart21button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart21button:setParent(obj.flpSkillFlowPart21);
    obj.flpSkillFlowPart21button:setName("flpSkillFlowPart21button");
    obj.flpSkillFlowPart21button:setAlign("left");
    obj.flpSkillFlowPart21button:setText("@@DnD5e.skills.performance");
    obj.flpSkillFlowPart21button:setWidth(122);
    obj.flpSkillFlowPart21button:setMargins({left=2});
    obj.flpSkillFlowPart21button:setFontSize(12);


				table.insert(self.__attrSortData.carisma, {title="@@DnD5e.skills.performance", controlName="flpSkillFlowPart21"});				
			


    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.flowLayout9);
    obj.dataLink69:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.atuacao', 'pericias.bonusatuacaostrAltAtr', 'bonusHabilidades'});
    obj.dataLink69:setName("dataLink69");

    obj.flpSkillFlowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart22:setParent(obj.flowLayout9);
    obj.flpSkillFlowPart22:setMinWidth(206);
    obj.flpSkillFlowPart22:setMaxWidth(250);
    obj.flpSkillFlowPart22:setHeight(17);
    obj.flpSkillFlowPart22:setName("flpSkillFlowPart22");
    obj.flpSkillFlowPart22:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart22:setVertAlign("leading");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.flpSkillFlowPart22);
    obj.image22:setAlign("left");
    obj.image22:setWidth(20);
    obj.image22:setHeight(20);
    obj.image22:setMargins({});
    obj.image22:setName("image22");
    obj.image22:setField("pericias.enganacaoIcon");
    obj.image22:setStyle("proportional");
    obj.image22:setHitTest(true);

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.flpSkillFlowPart22);
    obj.dataLink70:setField("pericias.enganacaoIcon");
    obj.dataLink70:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink70:setName("dataLink70");

    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.flpSkillFlowPart22);
    obj.dataLink71:setField("pericias.enganacao");
    obj.dataLink71:setName("dataLink71");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.flpSkillFlowPart22);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(26);
    obj.layout34:setMargins({left=2});
    obj.layout34:setHitTest(true);
    obj.layout34:setName("layout34");

    obj.flpSkillFlowPart22str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart22str:setParent(obj.layout34);
    obj.flpSkillFlowPart22str:setName("flpSkillFlowPart22str");
    obj.flpSkillFlowPart22str:setField("pericias.bonusenganacaostr");
    obj.flpSkillFlowPart22str:setAlign("client");
    obj.flpSkillFlowPart22str:setHorzTextAlign("center");
    obj.flpSkillFlowPart22str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart22str:setTextTrimming("none");
    obj.flpSkillFlowPart22str:setFontColor("white");

    obj.horzLine22 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine22:setParent(obj.layout34);
    obj.horzLine22:setStrokeColor("white");
    obj.horzLine22:setStrokeSize(1);
    obj.horzLine22:setAlign("bottom");
    obj.horzLine22:setName("horzLine22");

    obj.flpSkillFlowPart22button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart22button:setParent(obj.flpSkillFlowPart22);
    obj.flpSkillFlowPart22button:setName("flpSkillFlowPart22button");
    obj.flpSkillFlowPart22button:setAlign("left");
    obj.flpSkillFlowPart22button:setText("@@DnD5e.skills.deception");
    obj.flpSkillFlowPart22button:setWidth(122);
    obj.flpSkillFlowPart22button:setMargins({left=2});
    obj.flpSkillFlowPart22button:setFontSize(12);


				table.insert(self.__attrSortData.carisma, {title="@@DnD5e.skills.deception", controlName="flpSkillFlowPart22"});				
			


    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.flowLayout9);
    obj.dataLink72:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.enganacao', 'pericias.bonusenganacaostrAltAtr', 'bonusHabilidades'});
    obj.dataLink72:setName("dataLink72");

    obj.flpSkillFlowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart23:setParent(obj.flowLayout9);
    obj.flpSkillFlowPart23:setMinWidth(206);
    obj.flpSkillFlowPart23:setMaxWidth(250);
    obj.flpSkillFlowPart23:setHeight(17);
    obj.flpSkillFlowPart23:setName("flpSkillFlowPart23");
    obj.flpSkillFlowPart23:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart23:setVertAlign("leading");

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.flpSkillFlowPart23);
    obj.image23:setAlign("left");
    obj.image23:setWidth(20);
    obj.image23:setHeight(20);
    obj.image23:setMargins({});
    obj.image23:setName("image23");
    obj.image23:setField("pericias.intimidacaoIcon");
    obj.image23:setStyle("proportional");
    obj.image23:setHitTest(true);

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.flpSkillFlowPart23);
    obj.dataLink73:setField("pericias.intimidacaoIcon");
    obj.dataLink73:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink73:setName("dataLink73");

    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.flpSkillFlowPart23);
    obj.dataLink74:setField("pericias.intimidacao");
    obj.dataLink74:setName("dataLink74");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.flpSkillFlowPart23);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(26);
    obj.layout35:setMargins({left=2});
    obj.layout35:setHitTest(true);
    obj.layout35:setName("layout35");

    obj.flpSkillFlowPart23str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart23str:setParent(obj.layout35);
    obj.flpSkillFlowPart23str:setName("flpSkillFlowPart23str");
    obj.flpSkillFlowPart23str:setField("pericias.bonusintimidacaostr");
    obj.flpSkillFlowPart23str:setAlign("client");
    obj.flpSkillFlowPart23str:setHorzTextAlign("center");
    obj.flpSkillFlowPart23str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart23str:setTextTrimming("none");
    obj.flpSkillFlowPart23str:setFontColor("white");

    obj.horzLine23 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine23:setParent(obj.layout35);
    obj.horzLine23:setStrokeColor("white");
    obj.horzLine23:setStrokeSize(1);
    obj.horzLine23:setAlign("bottom");
    obj.horzLine23:setName("horzLine23");

    obj.flpSkillFlowPart23button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart23button:setParent(obj.flpSkillFlowPart23);
    obj.flpSkillFlowPart23button:setName("flpSkillFlowPart23button");
    obj.flpSkillFlowPart23button:setAlign("left");
    obj.flpSkillFlowPart23button:setText("@@DnD5e.skills.intimidation");
    obj.flpSkillFlowPart23button:setWidth(122);
    obj.flpSkillFlowPart23button:setMargins({left=2});
    obj.flpSkillFlowPart23button:setFontSize(12);


				table.insert(self.__attrSortData.carisma, {title="@@DnD5e.skills.intimidation", controlName="flpSkillFlowPart23"});				
			


    obj.dataLink75 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.flowLayout9);
    obj.dataLink75:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.intimidacao', 'pericias.bonusintimidacaostrAltAtr', 'bonusHabilidades'});
    obj.dataLink75:setName("dataLink75");

    obj.flpSkillFlowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpSkillFlowPart24:setParent(obj.flowLayout9);
    obj.flpSkillFlowPart24:setMinWidth(206);
    obj.flpSkillFlowPart24:setMaxWidth(250);
    obj.flpSkillFlowPart24:setHeight(17);
    obj.flpSkillFlowPart24:setName("flpSkillFlowPart24");
    obj.flpSkillFlowPart24:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flpSkillFlowPart24:setVertAlign("leading");

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.flpSkillFlowPart24);
    obj.image24:setAlign("left");
    obj.image24:setWidth(20);
    obj.image24:setHeight(20);
    obj.image24:setMargins({});
    obj.image24:setName("image24");
    obj.image24:setField("pericias.persuasaoIcon");
    obj.image24:setStyle("proportional");
    obj.image24:setHitTest(true);

    obj.dataLink76 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.flpSkillFlowPart24);
    obj.dataLink76:setField("pericias.persuasaoIcon");
    obj.dataLink76:setDefaultValue("http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png");
    obj.dataLink76:setName("dataLink76");

    obj.dataLink77 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.flpSkillFlowPart24);
    obj.dataLink77:setField("pericias.persuasao");
    obj.dataLink77:setName("dataLink77");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.flpSkillFlowPart24);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(26);
    obj.layout36:setMargins({left=2});
    obj.layout36:setHitTest(true);
    obj.layout36:setName("layout36");

    obj.flpSkillFlowPart24str = GUI.fromHandle(_obj_newObject("label"));
    obj.flpSkillFlowPart24str:setParent(obj.layout36);
    obj.flpSkillFlowPart24str:setName("flpSkillFlowPart24str");
    obj.flpSkillFlowPart24str:setField("pericias.bonuspersuasaostr");
    obj.flpSkillFlowPart24str:setAlign("client");
    obj.flpSkillFlowPart24str:setHorzTextAlign("center");
    obj.flpSkillFlowPart24str:setVertTextAlign("trailing");
    obj.flpSkillFlowPart24str:setTextTrimming("none");
    obj.flpSkillFlowPart24str:setFontColor("white");

    obj.horzLine24 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine24:setParent(obj.layout36);
    obj.horzLine24:setStrokeColor("white");
    obj.horzLine24:setStrokeSize(1);
    obj.horzLine24:setAlign("bottom");
    obj.horzLine24:setName("horzLine24");

    obj.flpSkillFlowPart24button = GUI.fromHandle(_obj_newObject("button"));
    obj.flpSkillFlowPart24button:setParent(obj.flpSkillFlowPart24);
    obj.flpSkillFlowPart24button:setName("flpSkillFlowPart24button");
    obj.flpSkillFlowPart24button:setAlign("left");
    obj.flpSkillFlowPart24button:setText("@@DnD5e.skills.persuasion");
    obj.flpSkillFlowPart24button:setWidth(122);
    obj.flpSkillFlowPart24button:setMargins({left=2});
    obj.flpSkillFlowPart24button:setFontSize(12);


				table.insert(self.__attrSortData.carisma, {title="@@DnD5e.skills.persuasion", controlName="flpSkillFlowPart24"});				
			


    obj.dataLink78 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.flowLayout9);
    obj.dataLink78:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.persuasao', 'pericias.bonuspersuasaostrAltAtr', 'bonusHabilidades'});
    obj.dataLink78:setName("dataLink78");


					self:sortFrontSkillBoxes();
				


    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.fraFrenteLayout);
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setVertAlign("leading");
    obj.flowLayout10:setMaxControlsPerLine(1);
    obj.flowLayout10:setName("flowLayout10");
    obj.flowLayout10:setStepSizes({310, 360});
    obj.flowLayout10:setMinScaledWidth(300);
    obj.flowLayout10:setMaxScaledWidth(340);
    obj.flowLayout10:setAvoidScale(true);
    obj.flowLayout10:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowLayout10);
    obj.flowLayout11:setMinWidth(235);
    obj.flowLayout11:setMaxWidth(475);
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setAvoidScale(false);
    obj.flowLayout11:setVertAlign("center");
    obj.flowLayout11:setHorzAlign("justify");
    obj.flowLayout11:setName("flowLayout11");
    obj.flowLayout11:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout11);
    obj.flowPart12:setStepSizes({105});
    obj.flowPart12:setMinScaledWidth(75);
    obj.flowPart12:setHeight(120);
    obj.flowPart12:setFrameStyle("frames/shield/frame.xml");
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart12:setVertAlign("leading");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart12);
    obj.label6:setAlign("top");
    obj.label6:setText("@@DnD5e.frente.lab.CA");
    obj.label6:setHeight(20);
    obj.label6:setFontSize(9);
    obj.label6:setWordWrap(true);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setTextTrimming("none");
    obj.label6:setName("label6");
    obj.label6:setFontColor("white");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart12);
    obj.edit12:setAlign("client");
    obj.edit12:setField("CA");
    obj.edit12:setFontSize(30);
    obj.edit12:setName("edit12");
    obj.edit12:setTransparent(true);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontColor("white");

    obj.dataLink79 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.flowLayout11);
    obj.dataLink79:setFields({'caEquip', 'atributos.moddestrezastr', 'caEquipDexMode'});
    obj.dataLink79:setName("dataLink79");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout11);
    obj.flowPart13:setStepSizes({105});
    obj.flowPart13:setMinScaledWidth(75);
    obj.flowPart13:setHeight(120);
    obj.flowPart13:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart13:setVertAlign("leading");

    obj.initiativeBut = GUI.fromHandle(_obj_newObject("button"));
    obj.initiativeBut:setParent(obj.flowPart13);
    obj.initiativeBut:setName("initiativeBut");
    obj.initiativeBut:setAlign("top");
    obj.initiativeBut:setText("@@DnD5e.frente.lab.initiative");
    obj.initiativeBut:setHeight(20);
    obj.initiativeBut:setFontSize(9);
    obj.initiativeBut:setWordWrap(true);
    obj.initiativeBut:setHorzTextAlign("center");
    obj.initiativeBut:setTextTrimming("none");
    obj.initiativeBut:setMargins({left=10,right=10});

    obj.initiativeVal = GUI.fromHandle(_obj_newObject("edit"));
    obj.initiativeVal:setParent(obj.flowPart13);
    obj.initiativeVal:setName("initiativeVal");
    obj.initiativeVal:setAlign("client");
    obj.initiativeVal:setField("iniciativa");
    obj.initiativeVal:setFontSize(30);
    obj.initiativeVal:setTransparent(true);
    obj.initiativeVal:setVertTextAlign("center");
    obj.initiativeVal:setHorzTextAlign("center");
    obj.initiativeVal:setFontColor("white");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout11);
    obj.flowPart14:setStepSizes({105});
    obj.flowPart14:setMinScaledWidth(75);
    obj.flowPart14:setHeight(120);
    obj.flowPart14:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart14:setVertAlign("leading");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart14);
    obj.label7:setAlign("top");
    obj.label7:setText("@@DnD5e.frente.lab.displacement");
    obj.label7:setHeight(20);
    obj.label7:setFontSize(9);
    obj.label7:setWordWrap(true);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setTextTrimming("none");
    obj.label7:setName("label7");
    obj.label7:setFontColor("white");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart14);
    obj.edit13:setAlign("client");
    obj.edit13:setField("deslocamento");
    obj.edit13:setFontSize(30);
    obj.edit13:setName("edit13");
    obj.edit13:setTransparent(true);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontColor("white");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout10);
    obj.flowPart15:setMinWidth(235);
    obj.flowPart15:setMaxWidth(475);
    obj.flowPart15:setMinScaledWidth(200);
    obj.flowPart15:setHeight(175);
    obj.flowPart15:setMargins({left=2, right=2, top=4, bottom=8});
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setVertAlign("leading");

    obj.frame1 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame1:setParent(obj.flowPart15);
    obj.frame1:setAlign("client");
    obj.frame1:setFrameStyle("frames/panel5/topPanel.xml");
    obj.frame1:setMargins({left = 4, right = 4, bottom=4});
    obj.frame1:setName("frame1");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.frame1);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout37);
    obj.label8:setAlign("left");
    obj.label8:setAutoSize(true);
    obj.label8:setText("@@DnD5e.frente.lab.PVMax");
    obj.label8:setTextTrimming("none");
    obj.label8:setWordWrap(false);
    obj.label8:setFontSize(12);
    obj.label8:setHorzTextAlign("trailing");
    obj.label8:setName("label8");
    obj.label8:setFontColor("#D0D0D0");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout37);
    obj.layout38:setAlign("client");
    obj.layout38:setMargins({left=5, right=3});
    obj.layout38:setName("layout38");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout38);
    obj.edit14:setAlign("client");
    obj.edit14:setField("PVMax");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");
    obj.edit14:setFontSize(15);
    obj.edit14:setFontColor("white");
    obj.edit14:setTransparent(true);

    obj.horzLine25 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine25:setParent(obj.layout38);
    obj.horzLine25:setAlign("bottom");
    obj.horzLine25:setStrokeColor("gray");
    obj.horzLine25:setName("horzLine25");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout37);
    obj.button1:setText("@@DnD5e.generic.damage");
    obj.button1:setAlign("right");
    obj.button1:setWidth(50);
    obj.button1:setMargins({right=5});
    obj.button1:setName("button1");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.frame1);
    obj.edit15:setAlign("client");
    obj.edit15:setField("PV");
    obj.edit15:setMargins({top=2});
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setFontSize(36);
    lfm_setPropAsString(obj.edit15, "fontStyle", "bold");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("white");
    obj.edit15:setTransparent(true);

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.frame1);
    obj.label9:setAlign("bottom");
    obj.label9:setAutoSize(true);
    obj.label9:setText("@@DnD5e.frente.lab.PVCurrent");
    obj.label9:setFontSize(11);
    obj.label9:setVertTextAlign("center");
    obj.label9:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label9, "fontStyle", "bold");
    obj.label9:setName("label9");
    obj.label9:setFontColor("white");

    obj.frame2 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame2:setParent(obj.flowPart15);
    obj.frame2:setAlign("bottom");
    obj.frame2:setHeight(70);
    obj.frame2:setFrameStyle("frames/panel5/bottomPanel.xml");
    obj.frame2:setMargins({left = 4, right = 4});
    obj.frame2:setName("frame2");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.frame2);
    obj.edit16:setAlign("client");
    obj.edit16:setField("PVTemporario");
    obj.edit16:setMargins({top=2});
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setFontSize(36);
    lfm_setPropAsString(obj.edit16, "fontStyle", "bold");
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("white");
    obj.edit16:setTransparent(true);

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.frame2);
    obj.label10:setAlign("bottom");
    obj.label10:setAutoSize(true);
    obj.label10:setText("@@DnD5e.frente.lab.PVTemp");
    obj.label10:setFontSize(11);
    obj.label10:setVertTextAlign("center");
    obj.label10:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label10, "fontStyle", "bold");
    obj.label10:setName("label10");
    obj.label10:setFontColor("white");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.flowLayout10);
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setMinWidth(235);
    obj.flowLayout12:setMaxWidth(475);
    obj.flowLayout12:setMinScaledWidth(235);
    obj.flowLayout12:setHorzAlign("justify");
    obj.flowLayout12:setName("flowLayout12");
    obj.flowLayout12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout12:setVertAlign("leading");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout12);
    obj.flowPart16:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart16:setStepSizes({130, 150, 160});
    obj.flowPart16:setHeight(100);
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart16:setVertAlign("leading");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.flowPart16);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout39);
    obj.label11:setAlign("left");
    obj.label11:setAutoSize(true);
    obj.label11:setText("@@DnD5e.frente.lab.total");
    obj.label11:setTextTrimming("none");
    obj.label11:setWordWrap(false);
    obj.label11:setFontSize(10);
    obj.label11:setHorzTextAlign("trailing");
    obj.label11:setName("label11");
    obj.label11:setFontColor("#D0D0D0");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout39);
    obj.layout40:setAlign("client");
    obj.layout40:setMargins({left=5, right=3});
    obj.layout40:setName("layout40");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout40);
    obj.edit17:setAlign("client");
    obj.edit17:setField("DadosDeVidaTotal");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");
    obj.edit17:setFontSize(15);
    obj.edit17:setFontColor("white");
    obj.edit17:setTransparent(true);

    obj.horzLine26 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine26:setParent(obj.layout40);
    obj.horzLine26:setAlign("bottom");
    obj.horzLine26:setStrokeColor("gray");
    obj.horzLine26:setName("horzLine26");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart16);
    obj.edit18:setAlign("client");
    obj.edit18:setField("DadosDeVida");
    obj.edit18:setMargins({top=2});
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setFontSize(21);
    obj.edit18:setName("edit18");
    obj.edit18:setFontColor("white");
    obj.edit18:setTransparent(true);

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart16);
    obj.label12:setAlign("bottom");
    obj.label12:setAutoSize(true);
    obj.label12:setText("@@DnD5e.frente.lab.PVDice");
    obj.label12:setFontSize(11);
    obj.label12:setVertTextAlign("center");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");
    obj.label12:setFontColor("white");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout12);
    obj.flowPart17:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart17:setStepSizes({170, 170});
    obj.flowPart17:setHeight(100);
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart17:setVertAlign("leading");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.flowPart17);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(25);
    obj.layout41:setMargins({left=2});
    obj.layout41:setName("layout41");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout41);
    obj.label13:setAlign("client");
    obj.label13:setAutoSize(true);
    obj.label13:setFontSize(10);
    obj.label13:setText("@@DnD5e.frente.lab.sucess");
    obj.label13:setWordWrap(false);
    obj.label13:setVertTextAlign("center");
    obj.label13:setHorzTextAlign("trailing");
    obj.label13:setMargins({right=6});
    obj.label13:setName("label13");
    obj.label13:setFontColor("white");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout41);
    obj.imageCheckBox1:setAlign("right");
    obj.imageCheckBox1:setWidth(25);
    obj.imageCheckBox1:setMargins({right=2});
    obj.imageCheckBox1:setField("testesContraMorte.s0");
    obj.imageCheckBox1:setOptimize(false);
    obj.imageCheckBox1:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox1:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox1:setName("imageCheckBox1");
    obj.imageCheckBox1:setHeight(20);

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout41);
    obj.imageCheckBox2:setAlign("right");
    obj.imageCheckBox2:setWidth(25);
    obj.imageCheckBox2:setMargins({right=2});
    obj.imageCheckBox2:setField("testesContraMorte.s1");
    obj.imageCheckBox2:setOptimize(false);
    obj.imageCheckBox2:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox2:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox2:setName("imageCheckBox2");
    obj.imageCheckBox2:setHeight(20);

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout41);
    obj.imageCheckBox3:setAlign("right");
    obj.imageCheckBox3:setWidth(25);
    obj.imageCheckBox3:setMargins({right=6});
    obj.imageCheckBox3:setField("testesContraMorte.s2");
    obj.imageCheckBox3:setOptimize(false);
    obj.imageCheckBox3:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox3:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox3:setName("imageCheckBox3");
    obj.imageCheckBox3:setHeight(20);

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.flowPart17);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(25);
    obj.layout42:setMargins({left=2, top = 4});
    obj.layout42:setName("layout42");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout42);
    obj.label14:setAlign("client");
    obj.label14:setAutoSize(true);
    obj.label14:setFontSize(10);
    obj.label14:setText("@@DnD5e.frente.lab.flaws");
    obj.label14:setVertTextAlign("center");
    obj.label14:setHorzTextAlign("trailing");
    obj.label14:setMargins({right=6});
    obj.label14:setName("label14");
    obj.label14:setFontColor("white");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout42);
    obj.imageCheckBox4:setAlign("right");
    obj.imageCheckBox4:setWidth(25);
    obj.imageCheckBox4:setMargins({right=2});
    obj.imageCheckBox4:setField("testesContraMorte.f0");
    obj.imageCheckBox4:setOptimize(false);
    obj.imageCheckBox4:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox4:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox4:setName("imageCheckBox4");
    obj.imageCheckBox4:setHeight(20);

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout42);
    obj.imageCheckBox5:setAlign("right");
    obj.imageCheckBox5:setWidth(25);
    obj.imageCheckBox5:setMargins({right=2});
    obj.imageCheckBox5:setField("testesContraMorte.f1");
    obj.imageCheckBox5:setOptimize(false);
    obj.imageCheckBox5:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox5:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox5:setName("imageCheckBox5");
    obj.imageCheckBox5:setHeight(20);

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout42);
    obj.imageCheckBox6:setAlign("right");
    obj.imageCheckBox6:setWidth(25);
    obj.imageCheckBox6:setMargins({right=6});
    obj.imageCheckBox6:setField("testesContraMorte.f2");
    obj.imageCheckBox6:setOptimize(false);
    obj.imageCheckBox6:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox6:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox6:setName("imageCheckBox6");
    obj.imageCheckBox6:setHeight(20);

    obj.DeathSave = GUI.fromHandle(_obj_newObject("button"));
    obj.DeathSave:setParent(obj.flowPart17);
    obj.DeathSave:setAlign("bottom");
    obj.DeathSave:setName("DeathSave");
    obj.DeathSave:setText("@@DnD5e.frente.lab.deathteste");
    obj.DeathSave:setFontSize(11);
    obj.DeathSave:setVertTextAlign("center");
    obj.DeathSave:setHorzTextAlign("center");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Filtro de Monstro");
    obj.tab2:setName("tab2");

    obj.frmMonster = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMonster:setParent(obj.tab2);
    obj.frmMonster:setName("frmMonster");
    obj.frmMonster:setAlign("client");


  


    obj.popDescrition = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDescrition:setParent(obj.frmMonster);
    obj.popDescrition:setName("popDescrition");
    obj.popDescrition:setWidth(200);
    obj.popDescrition:setHeight(200);
    obj.popDescrition:setBackOpacity(0.4);

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popDescrition);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("description");
    obj.textEditor1:setName("textEditor1");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.frmMonster);
    obj.layout43:setAlign("bottom");
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout43);
    obj.button2:setAlign("left");
    obj.button2:setHorzTextAlign("center");
    obj.button2:setWidth(375);
    obj.button2:setText("Filter");
    obj.button2:setName("button2");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmMonster);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.scrollBox2);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout44);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(75);
    obj.checkBox1:setHorzTextAlign("center");
    obj.checkBox1:setText("Name");
    obj.checkBox1:setField("enableName");
    obj.checkBox1:setMargins({right=25, bottom=5, top=5});
    obj.checkBox1:setName("checkBox1");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout44);
    obj.edit19:setAlign("left");
    obj.edit19:setWidth(275);
    obj.edit19:setField("nameFilter");
    obj.edit19:setName("edit19");
    obj.edit19:setFontSize(15);
    obj.edit19:setFontColor("white");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modforca = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modforcastr = "+" .. modificador;
            					else	
            						sheet.atributos.modforcastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modforca = nil;
            					sheet.atributos.modforcastr = nil;
            				end;
        end);

    obj._e_event1 = obj.modforcabutton:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.modforcastr);
        end);

    obj._e_event2 = obj.modforcabutton:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.modforcastr);
        end);

    obj._e_event3 = obj.modforcabutton:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'forca'}, nil, true);
        end);

    obj._e_event4 = obj.modforcabutton:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'forca'}, nil, false);
        end);

    obj._e_event5 = obj.modforcabutton:addEventListener("onMouseEnter",
        function ()
            self.modforcabutton:setFocus();
        end);

    obj._e_event6 = obj.modforcabutton:addEventListener("onExit",
        function ()
            self.modforcastr.fontColor = "white";
        end);

    obj._e_event7 = obj.image1:addEventListener("onClick",
        function (event)
            sheet.resistencias.forca = tonumber(sheet.resistencias.forca) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("true" == "true") then
            					sheet.resistencias.forca = (sheet.resistencias.forca + 1) % 2
            				else 
            					sheet.resistencias.forca = (sheet.resistencias.forca + 1) % 4
            				end
        end);

    obj._e_event8 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("true" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.resistencias.forca) or 0
            				sheet.resistencias.forcaIcon = pics[counter +1];
        end);

    obj._e_event9 = obj.layout3:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.resistencias.bonusforcastrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.resistencias.bonusforcastrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event10 = obj.flpSkillFlowPart1button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart1str);
        end);

    obj._e_event11 = obj.flpSkillFlowPart1button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart1str);
        end);

    obj._e_event12 = obj.flpSkillFlowPart1button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.forca'}, nil, true);
        end);

    obj._e_event13 = obj.flpSkillFlowPart1button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.forca'}, nil, false);
        end);

    obj._e_event14 = obj.flpSkillFlowPart1button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart1button:setFocus();
        end);

    obj._e_event15 = obj.flpSkillFlowPart1button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart1str.fontColor = "white";
        end);

    obj._e_event16 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.resistencias.bonusforcastrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.resistencias.bonusforcastrAltAtr]
            									local mod2 = sheet.atributos.modforca
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modforca;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								if sheet.resistencias.forca == true then
            									sheet.resistencias.forca = 1
            								end
            								temResistencia = sheet.resistencias.forca or 0;
            							else
            								temResistencia = 0;
            								sheet.resistencias = {};
            							end;
            													
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusResistencias) or 0)					
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusforca = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusforcastr = "+" .. valor;
            								else
            									sheet.resistencias.bonusforcastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusforca = nil;
            								sheet.resistencias.bonusforcastr = nil;
            							end;
        end);

    obj._e_event17 = obj.image2:addEventListener("onClick",
        function (event)
            sheet.pericias.atletismo = tonumber(sheet.pericias.atletismo) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.atletismo = (sheet.pericias.atletismo + 1) % 2
            				else 
            					sheet.pericias.atletismo = (sheet.pericias.atletismo + 1) % 4
            				end
        end);

    obj._e_event18 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.atletismo) or 0
            				sheet.pericias.atletismoIcon = pics[counter +1];
        end);

    obj._e_event19 = obj.layout4:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusatletismostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusatletismostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event20 = obj.flpSkillFlowPart2button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart2str);
        end);

    obj._e_event21 = obj.flpSkillFlowPart2button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart2str);
        end);

    obj._e_event22 = obj.flpSkillFlowPart2button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.atletismo'}, nil, true);
        end);

    obj._e_event23 = obj.flpSkillFlowPart2button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.atletismo'}, nil, false);
        end);

    obj._e_event24 = obj.flpSkillFlowPart2button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart2button:setFocus();
        end);

    obj._e_event25 = obj.flpSkillFlowPart2button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart2str.fontColor = "white";
        end);

    obj._e_event26 = obj.dataLink7:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusatletismostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusatletismostrAltAtr]
            									local mod2 = sheet.atributos.modforca
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modforca;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.atletismo == true then
            									sheet.pericias.atletismo = 1
            								end
            								temPericia = sheet.pericias.atletismo or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusatletismo	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusatletismostr = "+" .. valor;
            								else
            									sheet.pericias.bonusatletismostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusatletismo = nil;
            								sheet.pericias.bonusatletismostr = nil;
            							end;
        end);

    obj._e_event27 = obj.dataLink8:addEventListener("onChange",
        function (field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.moddestreza = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.moddestrezastr = "+" .. modificador;
            					else	
            						sheet.atributos.moddestrezastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.moddestreza = nil;
            					sheet.atributos.moddestrezastr = nil;
            				end;
        end);

    obj._e_event28 = obj.moddestrezabutton:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.moddestrezastr);
        end);

    obj._e_event29 = obj.moddestrezabutton:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.moddestrezastr);
        end);

    obj._e_event30 = obj.moddestrezabutton:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'destreza'}, nil, true);
        end);

    obj._e_event31 = obj.moddestrezabutton:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'destreza'}, nil, false);
        end);

    obj._e_event32 = obj.moddestrezabutton:addEventListener("onMouseEnter",
        function ()
            self.moddestrezabutton:setFocus();
        end);

    obj._e_event33 = obj.moddestrezabutton:addEventListener("onExit",
        function ()
            self.moddestrezastr.fontColor = "white";
        end);

    obj._e_event34 = obj.image3:addEventListener("onClick",
        function (event)
            sheet.resistencias.destreza = tonumber(sheet.resistencias.destreza) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("true" == "true") then
            					sheet.resistencias.destreza = (sheet.resistencias.destreza + 1) % 2
            				else 
            					sheet.resistencias.destreza = (sheet.resistencias.destreza + 1) % 4
            				end
        end);

    obj._e_event35 = obj.dataLink10:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("true" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.resistencias.destreza) or 0
            				sheet.resistencias.destrezaIcon = pics[counter +1];
        end);

    obj._e_event36 = obj.layout7:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.resistencias.bonusdestrezastrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.resistencias.bonusdestrezastrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event37 = obj.flpSkillFlowPart3button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart3str);
        end);

    obj._e_event38 = obj.flpSkillFlowPart3button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart3str);
        end);

    obj._e_event39 = obj.flpSkillFlowPart3button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.destreza'}, nil, true);
        end);

    obj._e_event40 = obj.flpSkillFlowPart3button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.destreza'}, nil, false);
        end);

    obj._e_event41 = obj.flpSkillFlowPart3button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart3button:setFocus();
        end);

    obj._e_event42 = obj.flpSkillFlowPart3button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart3str.fontColor = "white";
        end);

    obj._e_event43 = obj.dataLink11:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.resistencias.bonusdestrezastrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.resistencias.bonusdestrezastrAltAtr]
            									local mod2 = sheet.atributos.moddestreza
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.moddestreza;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								if sheet.resistencias.destreza == true then
            									sheet.resistencias.destreza = 1
            								end
            								temResistencia = sheet.resistencias.destreza or 0;
            							else
            								temResistencia = 0;
            								sheet.resistencias = {};
            							end;
            													
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusResistencias) or 0)					
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusdestreza = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusdestrezastr = "+" .. valor;
            								else
            									sheet.resistencias.bonusdestrezastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusdestreza = nil;
            								sheet.resistencias.bonusdestrezastr = nil;
            							end;
        end);

    obj._e_event44 = obj.image4:addEventListener("onClick",
        function (event)
            sheet.pericias.acrobacia = tonumber(sheet.pericias.acrobacia) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.acrobacia = (sheet.pericias.acrobacia + 1) % 2
            				else 
            					sheet.pericias.acrobacia = (sheet.pericias.acrobacia + 1) % 4
            				end
        end);

    obj._e_event45 = obj.dataLink13:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.acrobacia) or 0
            				sheet.pericias.acrobaciaIcon = pics[counter +1];
        end);

    obj._e_event46 = obj.layout8:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusacrobaciastrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusacrobaciastrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event47 = obj.flpSkillFlowPart4button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart4str);
        end);

    obj._e_event48 = obj.flpSkillFlowPart4button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart4str);
        end);

    obj._e_event49 = obj.flpSkillFlowPart4button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.acrobacia'}, nil, true);
        end);

    obj._e_event50 = obj.flpSkillFlowPart4button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.acrobacia'}, nil, false);
        end);

    obj._e_event51 = obj.flpSkillFlowPart4button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart4button:setFocus();
        end);

    obj._e_event52 = obj.flpSkillFlowPart4button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart4str.fontColor = "white";
        end);

    obj._e_event53 = obj.dataLink14:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusacrobaciastrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusacrobaciastrAltAtr]
            									local mod2 = sheet.atributos.moddestreza
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.moddestreza;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.acrobacia == true then
            									sheet.pericias.acrobacia = 1
            								end
            								temPericia = sheet.pericias.acrobacia or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusacrobacia	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusacrobaciastr = "+" .. valor;
            								else
            									sheet.pericias.bonusacrobaciastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusacrobacia = nil;
            								sheet.pericias.bonusacrobaciastr = nil;
            							end;
        end);

    obj._e_event54 = obj.image5:addEventListener("onClick",
        function (event)
            sheet.pericias.furtividade = tonumber(sheet.pericias.furtividade) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.furtividade = (sheet.pericias.furtividade + 1) % 2
            				else 
            					sheet.pericias.furtividade = (sheet.pericias.furtividade + 1) % 4
            				end
        end);

    obj._e_event55 = obj.dataLink16:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.furtividade) or 0
            				sheet.pericias.furtividadeIcon = pics[counter +1];
        end);

    obj._e_event56 = obj.layout9:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusfurtividadestrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusfurtividadestrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event57 = obj.flpSkillFlowPart5button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart5str);
        end);

    obj._e_event58 = obj.flpSkillFlowPart5button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart5str);
        end);

    obj._e_event59 = obj.flpSkillFlowPart5button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.furtividade'}, nil, true);
        end);

    obj._e_event60 = obj.flpSkillFlowPart5button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.furtividade'}, nil, false);
        end);

    obj._e_event61 = obj.flpSkillFlowPart5button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart5button:setFocus();
        end);

    obj._e_event62 = obj.flpSkillFlowPart5button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart5str.fontColor = "white";
        end);

    obj._e_event63 = obj.dataLink17:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusfurtividadestrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusfurtividadestrAltAtr]
            									local mod2 = sheet.atributos.moddestreza
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.moddestreza;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.furtividade == true then
            									sheet.pericias.furtividade = 1
            								end
            								temPericia = sheet.pericias.furtividade or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusfurtividade	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusfurtividadestr = "+" .. valor;
            								else
            									sheet.pericias.bonusfurtividadestr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusfurtividade = nil;
            								sheet.pericias.bonusfurtividadestr = nil;
            							end;
        end);

    obj._e_event64 = obj.image6:addEventListener("onClick",
        function (event)
            sheet.pericias.prestidigitacao = tonumber(sheet.pericias.prestidigitacao) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.prestidigitacao = (sheet.pericias.prestidigitacao + 1) % 2
            				else 
            					sheet.pericias.prestidigitacao = (sheet.pericias.prestidigitacao + 1) % 4
            				end
        end);

    obj._e_event65 = obj.dataLink19:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.prestidigitacao) or 0
            				sheet.pericias.prestidigitacaoIcon = pics[counter +1];
        end);

    obj._e_event66 = obj.layout10:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusprestidigitacaostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusprestidigitacaostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event67 = obj.flpSkillFlowPart6button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart6str);
        end);

    obj._e_event68 = obj.flpSkillFlowPart6button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart6str);
        end);

    obj._e_event69 = obj.flpSkillFlowPart6button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.prestidigitacao'}, nil, true);
        end);

    obj._e_event70 = obj.flpSkillFlowPart6button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.prestidigitacao'}, nil, false);
        end);

    obj._e_event71 = obj.flpSkillFlowPart6button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart6button:setFocus();
        end);

    obj._e_event72 = obj.flpSkillFlowPart6button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart6str.fontColor = "white";
        end);

    obj._e_event73 = obj.dataLink20:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusprestidigitacaostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusprestidigitacaostrAltAtr]
            									local mod2 = sheet.atributos.moddestreza
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.moddestreza;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.prestidigitacao == true then
            									sheet.pericias.prestidigitacao = 1
            								end
            								temPericia = sheet.pericias.prestidigitacao or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusprestidigitacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusprestidigitacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusprestidigitacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusprestidigitacao = nil;
            								sheet.pericias.bonusprestidigitacaostr = nil;
            							end;
        end);

    obj._e_event74 = obj.dataLink21:addEventListener("onChange",
        function (field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modconstituicao = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modconstituicaostr = "+" .. modificador;
            					else	
            						sheet.atributos.modconstituicaostr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modconstituicao = nil;
            					sheet.atributos.modconstituicaostr = nil;
            				end;
        end);

    obj._e_event75 = obj.modconstituicaobutton:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.modconstituicaostr);
        end);

    obj._e_event76 = obj.modconstituicaobutton:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.modconstituicaostr);
        end);

    obj._e_event77 = obj.modconstituicaobutton:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'constituicao'}, nil, true);
        end);

    obj._e_event78 = obj.modconstituicaobutton:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'constituicao'}, nil, false);
        end);

    obj._e_event79 = obj.modconstituicaobutton:addEventListener("onMouseEnter",
        function ()
            self.modconstituicaobutton:setFocus();
        end);

    obj._e_event80 = obj.modconstituicaobutton:addEventListener("onExit",
        function ()
            self.modconstituicaostr.fontColor = "white";
        end);

    obj._e_event81 = obj.image7:addEventListener("onClick",
        function (event)
            sheet.resistencias.constituicao = tonumber(sheet.resistencias.constituicao) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("true" == "true") then
            					sheet.resistencias.constituicao = (sheet.resistencias.constituicao + 1) % 2
            				else 
            					sheet.resistencias.constituicao = (sheet.resistencias.constituicao + 1) % 4
            				end
        end);

    obj._e_event82 = obj.dataLink23:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("true" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.resistencias.constituicao) or 0
            				sheet.resistencias.constituicaoIcon = pics[counter +1];
        end);

    obj._e_event83 = obj.layout13:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.resistencias.bonusconstituicaostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.resistencias.bonusconstituicaostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event84 = obj.flpSkillFlowPart7button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart7str);
        end);

    obj._e_event85 = obj.flpSkillFlowPart7button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart7str);
        end);

    obj._e_event86 = obj.flpSkillFlowPart7button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.constituicao'}, nil, true);
        end);

    obj._e_event87 = obj.flpSkillFlowPart7button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.constituicao'}, nil, false);
        end);

    obj._e_event88 = obj.flpSkillFlowPart7button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart7button:setFocus();
        end);

    obj._e_event89 = obj.flpSkillFlowPart7button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart7str.fontColor = "white";
        end);

    obj._e_event90 = obj.dataLink24:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.resistencias.bonusconstituicaostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.resistencias.bonusconstituicaostrAltAtr]
            									local mod2 = sheet.atributos.modconstituicao
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modconstituicao;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								if sheet.resistencias.constituicao == true then
            									sheet.resistencias.constituicao = 1
            								end
            								temResistencia = sheet.resistencias.constituicao or 0;
            							else
            								temResistencia = 0;
            								sheet.resistencias = {};
            							end;
            													
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusResistencias) or 0)					
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusconstituicao = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusconstituicaostr = "+" .. valor;
            								else
            									sheet.resistencias.bonusconstituicaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusconstituicao = nil;
            								sheet.resistencias.bonusconstituicaostr = nil;
            							end;
        end);

    obj._e_event91 = obj.dataLink25:addEventListener("onChange",
        function (field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modinteligencia = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modinteligenciastr = "+" .. modificador;
            					else	
            						sheet.atributos.modinteligenciastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modinteligencia = nil;
            					sheet.atributos.modinteligenciastr = nil;
            				end;
        end);

    obj._e_event92 = obj.modinteligenciabutton:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.modinteligenciastr);
        end);

    obj._e_event93 = obj.modinteligenciabutton:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.modinteligenciastr);
        end);

    obj._e_event94 = obj.modinteligenciabutton:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'inteligencia'}, nil, true);
        end);

    obj._e_event95 = obj.modinteligenciabutton:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'inteligencia'}, nil, false);
        end);

    obj._e_event96 = obj.modinteligenciabutton:addEventListener("onMouseEnter",
        function ()
            self.modinteligenciabutton:setFocus();
        end);

    obj._e_event97 = obj.modinteligenciabutton:addEventListener("onExit",
        function ()
            self.modinteligenciastr.fontColor = "white";
        end);

    obj._e_event98 = obj.image8:addEventListener("onClick",
        function (event)
            sheet.resistencias.inteligencia = tonumber(sheet.resistencias.inteligencia) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("true" == "true") then
            					sheet.resistencias.inteligencia = (sheet.resistencias.inteligencia + 1) % 2
            				else 
            					sheet.resistencias.inteligencia = (sheet.resistencias.inteligencia + 1) % 4
            				end
        end);

    obj._e_event99 = obj.dataLink27:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("true" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.resistencias.inteligencia) or 0
            				sheet.resistencias.inteligenciaIcon = pics[counter +1];
        end);

    obj._e_event100 = obj.layout16:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.resistencias.bonusinteligenciastrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.resistencias.bonusinteligenciastrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event101 = obj.flpSkillFlowPart8button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart8str);
        end);

    obj._e_event102 = obj.flpSkillFlowPart8button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart8str);
        end);

    obj._e_event103 = obj.flpSkillFlowPart8button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.inteligencia'}, nil, true);
        end);

    obj._e_event104 = obj.flpSkillFlowPart8button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.inteligencia'}, nil, false);
        end);

    obj._e_event105 = obj.flpSkillFlowPart8button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart8button:setFocus();
        end);

    obj._e_event106 = obj.flpSkillFlowPart8button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart8str.fontColor = "white";
        end);

    obj._e_event107 = obj.dataLink28:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.resistencias.bonusinteligenciastrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.resistencias.bonusinteligenciastrAltAtr]
            									local mod2 = sheet.atributos.modinteligencia
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modinteligencia;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								if sheet.resistencias.inteligencia == true then
            									sheet.resistencias.inteligencia = 1
            								end
            								temResistencia = sheet.resistencias.inteligencia or 0;
            							else
            								temResistencia = 0;
            								sheet.resistencias = {};
            							end;
            													
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusResistencias) or 0)					
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusinteligencia = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusinteligenciastr = "+" .. valor;
            								else
            									sheet.resistencias.bonusinteligenciastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusinteligencia = nil;
            								sheet.resistencias.bonusinteligenciastr = nil;
            							end;
        end);

    obj._e_event108 = obj.image9:addEventListener("onClick",
        function (event)
            sheet.pericias.arcanismo = tonumber(sheet.pericias.arcanismo) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.arcanismo = (sheet.pericias.arcanismo + 1) % 2
            				else 
            					sheet.pericias.arcanismo = (sheet.pericias.arcanismo + 1) % 4
            				end
        end);

    obj._e_event109 = obj.dataLink30:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.arcanismo) or 0
            				sheet.pericias.arcanismoIcon = pics[counter +1];
        end);

    obj._e_event110 = obj.layout17:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusarcanismostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusarcanismostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event111 = obj.flpSkillFlowPart9button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart9str);
        end);

    obj._e_event112 = obj.flpSkillFlowPart9button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart9str);
        end);

    obj._e_event113 = obj.flpSkillFlowPart9button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.arcanismo'}, nil, true);
        end);

    obj._e_event114 = obj.flpSkillFlowPart9button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.arcanismo'}, nil, false);
        end);

    obj._e_event115 = obj.flpSkillFlowPart9button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart9button:setFocus();
        end);

    obj._e_event116 = obj.flpSkillFlowPart9button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart9str.fontColor = "white";
        end);

    obj._e_event117 = obj.dataLink31:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusarcanismostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusarcanismostrAltAtr]
            									local mod2 = sheet.atributos.modinteligencia
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modinteligencia;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.arcanismo == true then
            									sheet.pericias.arcanismo = 1
            								end
            								temPericia = sheet.pericias.arcanismo or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusarcanismo	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusarcanismostr = "+" .. valor;
            								else
            									sheet.pericias.bonusarcanismostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusarcanismo = nil;
            								sheet.pericias.bonusarcanismostr = nil;
            							end;
        end);

    obj._e_event118 = obj.image10:addEventListener("onClick",
        function (event)
            sheet.pericias.historia = tonumber(sheet.pericias.historia) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.historia = (sheet.pericias.historia + 1) % 2
            				else 
            					sheet.pericias.historia = (sheet.pericias.historia + 1) % 4
            				end
        end);

    obj._e_event119 = obj.dataLink33:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.historia) or 0
            				sheet.pericias.historiaIcon = pics[counter +1];
        end);

    obj._e_event120 = obj.layout18:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonushistoriastrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonushistoriastrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event121 = obj.flpSkillFlowPart10button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart10str);
        end);

    obj._e_event122 = obj.flpSkillFlowPart10button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart10str);
        end);

    obj._e_event123 = obj.flpSkillFlowPart10button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.historia'}, nil, true);
        end);

    obj._e_event124 = obj.flpSkillFlowPart10button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.historia'}, nil, false);
        end);

    obj._e_event125 = obj.flpSkillFlowPart10button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart10button:setFocus();
        end);

    obj._e_event126 = obj.flpSkillFlowPart10button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart10str.fontColor = "white";
        end);

    obj._e_event127 = obj.dataLink34:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonushistoriastrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonushistoriastrAltAtr]
            									local mod2 = sheet.atributos.modinteligencia
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modinteligencia;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.historia == true then
            									sheet.pericias.historia = 1
            								end
            								temPericia = sheet.pericias.historia or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonushistoria	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonushistoriastr = "+" .. valor;
            								else
            									sheet.pericias.bonushistoriastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonushistoria = nil;
            								sheet.pericias.bonushistoriastr = nil;
            							end;
        end);

    obj._e_event128 = obj.image11:addEventListener("onClick",
        function (event)
            sheet.pericias.investigacao = tonumber(sheet.pericias.investigacao) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.investigacao = (sheet.pericias.investigacao + 1) % 2
            				else 
            					sheet.pericias.investigacao = (sheet.pericias.investigacao + 1) % 4
            				end
        end);

    obj._e_event129 = obj.dataLink36:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.investigacao) or 0
            				sheet.pericias.investigacaoIcon = pics[counter +1];
        end);

    obj._e_event130 = obj.layout19:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusinvestigacaostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusinvestigacaostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event131 = obj.flpSkillFlowPart11button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart11str);
        end);

    obj._e_event132 = obj.flpSkillFlowPart11button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart11str);
        end);

    obj._e_event133 = obj.flpSkillFlowPart11button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.investigacao'}, nil, true);
        end);

    obj._e_event134 = obj.flpSkillFlowPart11button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.investigacao'}, nil, false);
        end);

    obj._e_event135 = obj.flpSkillFlowPart11button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart11button:setFocus();
        end);

    obj._e_event136 = obj.flpSkillFlowPart11button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart11str.fontColor = "white";
        end);

    obj._e_event137 = obj.dataLink37:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusinvestigacaostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusinvestigacaostrAltAtr]
            									local mod2 = sheet.atributos.modinteligencia
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modinteligencia;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.investigacao == true then
            									sheet.pericias.investigacao = 1
            								end
            								temPericia = sheet.pericias.investigacao or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusinvestigacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusinvestigacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusinvestigacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusinvestigacao = nil;
            								sheet.pericias.bonusinvestigacaostr = nil;
            							end;
        end);

    obj._e_event138 = obj.image12:addEventListener("onClick",
        function (event)
            sheet.pericias.natureza = tonumber(sheet.pericias.natureza) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.natureza = (sheet.pericias.natureza + 1) % 2
            				else 
            					sheet.pericias.natureza = (sheet.pericias.natureza + 1) % 4
            				end
        end);

    obj._e_event139 = obj.dataLink39:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.natureza) or 0
            				sheet.pericias.naturezaIcon = pics[counter +1];
        end);

    obj._e_event140 = obj.layout20:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusnaturezastrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusnaturezastrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event141 = obj.flpSkillFlowPart12button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart12str);
        end);

    obj._e_event142 = obj.flpSkillFlowPart12button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart12str);
        end);

    obj._e_event143 = obj.flpSkillFlowPart12button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.natureza'}, nil, true);
        end);

    obj._e_event144 = obj.flpSkillFlowPart12button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.natureza'}, nil, false);
        end);

    obj._e_event145 = obj.flpSkillFlowPart12button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart12button:setFocus();
        end);

    obj._e_event146 = obj.flpSkillFlowPart12button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart12str.fontColor = "white";
        end);

    obj._e_event147 = obj.dataLink40:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusnaturezastrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusnaturezastrAltAtr]
            									local mod2 = sheet.atributos.modinteligencia
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modinteligencia;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.natureza == true then
            									sheet.pericias.natureza = 1
            								end
            								temPericia = sheet.pericias.natureza or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusnatureza	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusnaturezastr = "+" .. valor;
            								else
            									sheet.pericias.bonusnaturezastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusnatureza = nil;
            								sheet.pericias.bonusnaturezastr = nil;
            							end;
        end);

    obj._e_event148 = obj.image13:addEventListener("onClick",
        function (event)
            sheet.pericias.religiao = tonumber(sheet.pericias.religiao) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.religiao = (sheet.pericias.religiao + 1) % 2
            				else 
            					sheet.pericias.religiao = (sheet.pericias.religiao + 1) % 4
            				end
        end);

    obj._e_event149 = obj.dataLink42:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.religiao) or 0
            				sheet.pericias.religiaoIcon = pics[counter +1];
        end);

    obj._e_event150 = obj.layout21:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusreligiaostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusreligiaostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event151 = obj.flpSkillFlowPart13button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart13str);
        end);

    obj._e_event152 = obj.flpSkillFlowPart13button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart13str);
        end);

    obj._e_event153 = obj.flpSkillFlowPart13button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.religiao'}, nil, true);
        end);

    obj._e_event154 = obj.flpSkillFlowPart13button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.religiao'}, nil, false);
        end);

    obj._e_event155 = obj.flpSkillFlowPart13button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart13button:setFocus();
        end);

    obj._e_event156 = obj.flpSkillFlowPart13button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart13str.fontColor = "white";
        end);

    obj._e_event157 = obj.dataLink43:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusreligiaostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusreligiaostrAltAtr]
            									local mod2 = sheet.atributos.modinteligencia
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modinteligencia;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.religiao == true then
            									sheet.pericias.religiao = 1
            								end
            								temPericia = sheet.pericias.religiao or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusreligiao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusreligiaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusreligiaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusreligiao = nil;
            								sheet.pericias.bonusreligiaostr = nil;
            							end;
        end);

    obj._e_event158 = obj.dataLink44:addEventListener("onChange",
        function (field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modsabedoria = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modsabedoriastr = "+" .. modificador;
            					else	
            						sheet.atributos.modsabedoriastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modsabedoria = nil;
            					sheet.atributos.modsabedoriastr = nil;
            				end;
        end);

    obj._e_event159 = obj.modsabedoriabutton:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.modsabedoriastr);
        end);

    obj._e_event160 = obj.modsabedoriabutton:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.modsabedoriastr);
        end);

    obj._e_event161 = obj.modsabedoriabutton:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'sabedoria'}, nil, true);
        end);

    obj._e_event162 = obj.modsabedoriabutton:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'sabedoria'}, nil, false);
        end);

    obj._e_event163 = obj.modsabedoriabutton:addEventListener("onMouseEnter",
        function ()
            self.modsabedoriabutton:setFocus();
        end);

    obj._e_event164 = obj.modsabedoriabutton:addEventListener("onExit",
        function ()
            self.modsabedoriastr.fontColor = "white";
        end);

    obj._e_event165 = obj.image14:addEventListener("onClick",
        function (event)
            sheet.resistencias.sabedoria = tonumber(sheet.resistencias.sabedoria) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("true" == "true") then
            					sheet.resistencias.sabedoria = (sheet.resistencias.sabedoria + 1) % 2
            				else 
            					sheet.resistencias.sabedoria = (sheet.resistencias.sabedoria + 1) % 4
            				end
        end);

    obj._e_event166 = obj.dataLink46:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("true" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.resistencias.sabedoria) or 0
            				sheet.resistencias.sabedoriaIcon = pics[counter +1];
        end);

    obj._e_event167 = obj.layout24:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.resistencias.bonussabedoriastrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.resistencias.bonussabedoriastrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event168 = obj.flpSkillFlowPart14button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart14str);
        end);

    obj._e_event169 = obj.flpSkillFlowPart14button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart14str);
        end);

    obj._e_event170 = obj.flpSkillFlowPart14button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.sabedoria'}, nil, true);
        end);

    obj._e_event171 = obj.flpSkillFlowPart14button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.sabedoria'}, nil, false);
        end);

    obj._e_event172 = obj.flpSkillFlowPart14button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart14button:setFocus();
        end);

    obj._e_event173 = obj.flpSkillFlowPart14button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart14str.fontColor = "white";
        end);

    obj._e_event174 = obj.dataLink47:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.resistencias.bonussabedoriastrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.resistencias.bonussabedoriastrAltAtr]
            									local mod2 = sheet.atributos.modsabedoria
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modsabedoria;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								if sheet.resistencias.sabedoria == true then
            									sheet.resistencias.sabedoria = 1
            								end
            								temResistencia = sheet.resistencias.sabedoria or 0;
            							else
            								temResistencia = 0;
            								sheet.resistencias = {};
            							end;
            													
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusResistencias) or 0)					
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonussabedoria = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonussabedoriastr = "+" .. valor;
            								else
            									sheet.resistencias.bonussabedoriastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonussabedoria = nil;
            								sheet.resistencias.bonussabedoriastr = nil;
            							end;
        end);

    obj._e_event175 = obj.image15:addEventListener("onClick",
        function (event)
            sheet.pericias.adestrarAnimais = tonumber(sheet.pericias.adestrarAnimais) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.adestrarAnimais = (sheet.pericias.adestrarAnimais + 1) % 2
            				else 
            					sheet.pericias.adestrarAnimais = (sheet.pericias.adestrarAnimais + 1) % 4
            				end
        end);

    obj._e_event176 = obj.dataLink49:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.adestrarAnimais) or 0
            				sheet.pericias.adestrarAnimaisIcon = pics[counter +1];
        end);

    obj._e_event177 = obj.layout25:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusadestrarAnimaisstrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusadestrarAnimaisstrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event178 = obj.flpSkillFlowPart15button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart15str);
        end);

    obj._e_event179 = obj.flpSkillFlowPart15button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart15str);
        end);

    obj._e_event180 = obj.flpSkillFlowPart15button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.adestrarAnimais'}, nil, true);
        end);

    obj._e_event181 = obj.flpSkillFlowPart15button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.adestrarAnimais'}, nil, false);
        end);

    obj._e_event182 = obj.flpSkillFlowPart15button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart15button:setFocus();
        end);

    obj._e_event183 = obj.flpSkillFlowPart15button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart15str.fontColor = "white";
        end);

    obj._e_event184 = obj.dataLink50:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusadestrarAnimaisstrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusadestrarAnimaisstrAltAtr]
            									local mod2 = sheet.atributos.modsabedoria
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modsabedoria;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.adestrarAnimais == true then
            									sheet.pericias.adestrarAnimais = 1
            								end
            								temPericia = sheet.pericias.adestrarAnimais or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusadestrarAnimais	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusadestrarAnimaisstr = "+" .. valor;
            								else
            									sheet.pericias.bonusadestrarAnimaisstr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusadestrarAnimais = nil;
            								sheet.pericias.bonusadestrarAnimaisstr = nil;
            							end;
        end);

    obj._e_event185 = obj.image16:addEventListener("onClick",
        function (event)
            sheet.pericias.intuicao = tonumber(sheet.pericias.intuicao) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.intuicao = (sheet.pericias.intuicao + 1) % 2
            				else 
            					sheet.pericias.intuicao = (sheet.pericias.intuicao + 1) % 4
            				end
        end);

    obj._e_event186 = obj.dataLink52:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.intuicao) or 0
            				sheet.pericias.intuicaoIcon = pics[counter +1];
        end);

    obj._e_event187 = obj.layout26:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusintuicaostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusintuicaostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event188 = obj.flpSkillFlowPart16button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart16str);
        end);

    obj._e_event189 = obj.flpSkillFlowPart16button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart16str);
        end);

    obj._e_event190 = obj.flpSkillFlowPart16button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.intuicao'}, nil, true);
        end);

    obj._e_event191 = obj.flpSkillFlowPart16button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.intuicao'}, nil, false);
        end);

    obj._e_event192 = obj.flpSkillFlowPart16button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart16button:setFocus();
        end);

    obj._e_event193 = obj.flpSkillFlowPart16button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart16str.fontColor = "white";
        end);

    obj._e_event194 = obj.dataLink53:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusintuicaostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusintuicaostrAltAtr]
            									local mod2 = sheet.atributos.modsabedoria
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modsabedoria;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.intuicao == true then
            									sheet.pericias.intuicao = 1
            								end
            								temPericia = sheet.pericias.intuicao or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusintuicao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusintuicaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusintuicaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusintuicao = nil;
            								sheet.pericias.bonusintuicaostr = nil;
            							end;
        end);

    obj._e_event195 = obj.image17:addEventListener("onClick",
        function (event)
            sheet.pericias.medicina = tonumber(sheet.pericias.medicina) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.medicina = (sheet.pericias.medicina + 1) % 2
            				else 
            					sheet.pericias.medicina = (sheet.pericias.medicina + 1) % 4
            				end
        end);

    obj._e_event196 = obj.dataLink55:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.medicina) or 0
            				sheet.pericias.medicinaIcon = pics[counter +1];
        end);

    obj._e_event197 = obj.layout27:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusmedicinastrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusmedicinastrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event198 = obj.flpSkillFlowPart17button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart17str);
        end);

    obj._e_event199 = obj.flpSkillFlowPart17button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart17str);
        end);

    obj._e_event200 = obj.flpSkillFlowPart17button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.medicina'}, nil, true);
        end);

    obj._e_event201 = obj.flpSkillFlowPart17button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.medicina'}, nil, false);
        end);

    obj._e_event202 = obj.flpSkillFlowPart17button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart17button:setFocus();
        end);

    obj._e_event203 = obj.flpSkillFlowPart17button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart17str.fontColor = "white";
        end);

    obj._e_event204 = obj.dataLink56:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusmedicinastrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusmedicinastrAltAtr]
            									local mod2 = sheet.atributos.modsabedoria
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modsabedoria;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.medicina == true then
            									sheet.pericias.medicina = 1
            								end
            								temPericia = sheet.pericias.medicina or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusmedicina	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusmedicinastr = "+" .. valor;
            								else
            									sheet.pericias.bonusmedicinastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusmedicina = nil;
            								sheet.pericias.bonusmedicinastr = nil;
            							end;
        end);

    obj._e_event205 = obj.image18:addEventListener("onClick",
        function (event)
            sheet.pericias.percepcao = tonumber(sheet.pericias.percepcao) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.percepcao = (sheet.pericias.percepcao + 1) % 2
            				else 
            					sheet.pericias.percepcao = (sheet.pericias.percepcao + 1) % 4
            				end
        end);

    obj._e_event206 = obj.dataLink58:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.percepcao) or 0
            				sheet.pericias.percepcaoIcon = pics[counter +1];
        end);

    obj._e_event207 = obj.layout28:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonuspercepcaostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonuspercepcaostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event208 = obj.flpSkillFlowPart18button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart18str);
        end);

    obj._e_event209 = obj.flpSkillFlowPart18button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart18str);
        end);

    obj._e_event210 = obj.flpSkillFlowPart18button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.percepcao'}, nil, true);
        end);

    obj._e_event211 = obj.flpSkillFlowPart18button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.percepcao'}, nil, false);
        end);

    obj._e_event212 = obj.flpSkillFlowPart18button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart18button:setFocus();
        end);

    obj._e_event213 = obj.flpSkillFlowPart18button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart18str.fontColor = "white";
        end);

    obj._e_event214 = obj.dataLink59:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonuspercepcaostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonuspercepcaostrAltAtr]
            									local mod2 = sheet.atributos.modsabedoria
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modsabedoria;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.percepcao == true then
            									sheet.pericias.percepcao = 1
            								end
            								temPericia = sheet.pericias.percepcao or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonuspercepcao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonuspercepcaostr = "+" .. valor;
            								else
            									sheet.pericias.bonuspercepcaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonuspercepcao = nil;
            								sheet.pericias.bonuspercepcaostr = nil;
            							end;
        end);

    obj._e_event215 = obj.image19:addEventListener("onClick",
        function (event)
            sheet.pericias.sobrevivencia = tonumber(sheet.pericias.sobrevivencia) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.sobrevivencia = (sheet.pericias.sobrevivencia + 1) % 2
            				else 
            					sheet.pericias.sobrevivencia = (sheet.pericias.sobrevivencia + 1) % 4
            				end
        end);

    obj._e_event216 = obj.dataLink61:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.sobrevivencia) or 0
            				sheet.pericias.sobrevivenciaIcon = pics[counter +1];
        end);

    obj._e_event217 = obj.layout29:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonussobrevivenciastrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonussobrevivenciastrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event218 = obj.flpSkillFlowPart19button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart19str);
        end);

    obj._e_event219 = obj.flpSkillFlowPart19button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart19str);
        end);

    obj._e_event220 = obj.flpSkillFlowPart19button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.sobrevivencia'}, nil, true);
        end);

    obj._e_event221 = obj.flpSkillFlowPart19button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.sobrevivencia'}, nil, false);
        end);

    obj._e_event222 = obj.flpSkillFlowPart19button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart19button:setFocus();
        end);

    obj._e_event223 = obj.flpSkillFlowPart19button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart19str.fontColor = "white";
        end);

    obj._e_event224 = obj.dataLink62:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonussobrevivenciastrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonussobrevivenciastrAltAtr]
            									local mod2 = sheet.atributos.modsabedoria
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modsabedoria;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.sobrevivencia == true then
            									sheet.pericias.sobrevivencia = 1
            								end
            								temPericia = sheet.pericias.sobrevivencia or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonussobrevivencia	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonussobrevivenciastr = "+" .. valor;
            								else
            									sheet.pericias.bonussobrevivenciastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonussobrevivencia = nil;
            								sheet.pericias.bonussobrevivenciastr = nil;
            							end;
        end);

    obj._e_event225 = obj.dataLink63:addEventListener("onChange",
        function (field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modcarisma = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modcarismastr = "+" .. modificador;
            					else	
            						sheet.atributos.modcarismastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modcarisma = nil;
            					sheet.atributos.modcarismastr = nil;
            				end;
        end);

    obj._e_event226 = obj.modcarismabutton:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.modcarismastr);
        end);

    obj._e_event227 = obj.modcarismabutton:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.modcarismastr);
        end);

    obj._e_event228 = obj.modcarismabutton:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'carisma'}, nil, true);
        end);

    obj._e_event229 = obj.modcarismabutton:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'carisma'}, nil, false);
        end);

    obj._e_event230 = obj.modcarismabutton:addEventListener("onMouseEnter",
        function ()
            self.modcarismabutton:setFocus();
        end);

    obj._e_event231 = obj.modcarismabutton:addEventListener("onExit",
        function ()
            self.modcarismastr.fontColor = "white";
        end);

    obj._e_event232 = obj.image20:addEventListener("onClick",
        function (event)
            sheet.resistencias.carisma = tonumber(sheet.resistencias.carisma) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("true" == "true") then
            					sheet.resistencias.carisma = (sheet.resistencias.carisma + 1) % 2
            				else 
            					sheet.resistencias.carisma = (sheet.resistencias.carisma + 1) % 4
            				end
        end);

    obj._e_event233 = obj.dataLink65:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("true" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.resistencias.carisma) or 0
            				sheet.resistencias.carismaIcon = pics[counter +1];
        end);

    obj._e_event234 = obj.layout32:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.resistencias.bonuscarismastrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.resistencias.bonuscarismastrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event235 = obj.flpSkillFlowPart20button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart20str);
        end);

    obj._e_event236 = obj.flpSkillFlowPart20button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart20str);
        end);

    obj._e_event237 = obj.flpSkillFlowPart20button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.carisma'}, nil, true);
        end);

    obj._e_event238 = obj.flpSkillFlowPart20button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.carisma'}, nil, false);
        end);

    obj._e_event239 = obj.flpSkillFlowPart20button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart20button:setFocus();
        end);

    obj._e_event240 = obj.flpSkillFlowPart20button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart20str.fontColor = "white";
        end);

    obj._e_event241 = obj.dataLink66:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.resistencias.bonuscarismastrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.resistencias.bonuscarismastrAltAtr]
            									local mod2 = sheet.atributos.modcarisma
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modcarisma;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								if sheet.resistencias.carisma == true then
            									sheet.resistencias.carisma = 1
            								end
            								temResistencia = sheet.resistencias.carisma or 0;
            							else
            								temResistencia = 0;
            								sheet.resistencias = {};
            							end;
            													
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusResistencias) or 0)					
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonuscarisma = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonuscarismastr = "+" .. valor;
            								else
            									sheet.resistencias.bonuscarismastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonuscarisma = nil;
            								sheet.resistencias.bonuscarismastr = nil;
            							end;
        end);

    obj._e_event242 = obj.image21:addEventListener("onClick",
        function (event)
            sheet.pericias.atuacao = tonumber(sheet.pericias.atuacao) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.atuacao = (sheet.pericias.atuacao + 1) % 2
            				else 
            					sheet.pericias.atuacao = (sheet.pericias.atuacao + 1) % 4
            				end
        end);

    obj._e_event243 = obj.dataLink68:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.atuacao) or 0
            				sheet.pericias.atuacaoIcon = pics[counter +1];
        end);

    obj._e_event244 = obj.layout33:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusatuacaostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusatuacaostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event245 = obj.flpSkillFlowPart21button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart21str);
        end);

    obj._e_event246 = obj.flpSkillFlowPart21button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart21str);
        end);

    obj._e_event247 = obj.flpSkillFlowPart21button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.atuacao'}, nil, true);
        end);

    obj._e_event248 = obj.flpSkillFlowPart21button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.atuacao'}, nil, false);
        end);

    obj._e_event249 = obj.flpSkillFlowPart21button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart21button:setFocus();
        end);

    obj._e_event250 = obj.flpSkillFlowPart21button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart21str.fontColor = "white";
        end);

    obj._e_event251 = obj.dataLink69:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusatuacaostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusatuacaostrAltAtr]
            									local mod2 = sheet.atributos.modcarisma
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modcarisma;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.atuacao == true then
            									sheet.pericias.atuacao = 1
            								end
            								temPericia = sheet.pericias.atuacao or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusatuacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusatuacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusatuacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusatuacao = nil;
            								sheet.pericias.bonusatuacaostr = nil;
            							end;
        end);

    obj._e_event252 = obj.image22:addEventListener("onClick",
        function (event)
            sheet.pericias.enganacao = tonumber(sheet.pericias.enganacao) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.enganacao = (sheet.pericias.enganacao + 1) % 2
            				else 
            					sheet.pericias.enganacao = (sheet.pericias.enganacao + 1) % 4
            				end
        end);

    obj._e_event253 = obj.dataLink71:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.enganacao) or 0
            				sheet.pericias.enganacaoIcon = pics[counter +1];
        end);

    obj._e_event254 = obj.layout34:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusenganacaostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusenganacaostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event255 = obj.flpSkillFlowPart22button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart22str);
        end);

    obj._e_event256 = obj.flpSkillFlowPart22button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart22str);
        end);

    obj._e_event257 = obj.flpSkillFlowPart22button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.enganacao'}, nil, true);
        end);

    obj._e_event258 = obj.flpSkillFlowPart22button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.enganacao'}, nil, false);
        end);

    obj._e_event259 = obj.flpSkillFlowPart22button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart22button:setFocus();
        end);

    obj._e_event260 = obj.flpSkillFlowPart22button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart22str.fontColor = "white";
        end);

    obj._e_event261 = obj.dataLink72:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusenganacaostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusenganacaostrAltAtr]
            									local mod2 = sheet.atributos.modcarisma
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modcarisma;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.enganacao == true then
            									sheet.pericias.enganacao = 1
            								end
            								temPericia = sheet.pericias.enganacao or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusenganacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusenganacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusenganacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusenganacao = nil;
            								sheet.pericias.bonusenganacaostr = nil;
            							end;
        end);

    obj._e_event262 = obj.image23:addEventListener("onClick",
        function (event)
            sheet.pericias.intimidacao = tonumber(sheet.pericias.intimidacao) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.intimidacao = (sheet.pericias.intimidacao + 1) % 2
            				else 
            					sheet.pericias.intimidacao = (sheet.pericias.intimidacao + 1) % 4
            				end
        end);

    obj._e_event263 = obj.dataLink74:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.intimidacao) or 0
            				sheet.pericias.intimidacaoIcon = pics[counter +1];
        end);

    obj._e_event264 = obj.layout35:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonusintimidacaostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonusintimidacaostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event265 = obj.flpSkillFlowPart23button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart23str);
        end);

    obj._e_event266 = obj.flpSkillFlowPart23button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart23str);
        end);

    obj._e_event267 = obj.flpSkillFlowPart23button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.intimidacao'}, nil, true);
        end);

    obj._e_event268 = obj.flpSkillFlowPart23button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.intimidacao'}, nil, false);
        end);

    obj._e_event269 = obj.flpSkillFlowPart23button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart23button:setFocus();
        end);

    obj._e_event270 = obj.flpSkillFlowPart23button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart23str.fontColor = "white";
        end);

    obj._e_event271 = obj.dataLink75:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonusintimidacaostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonusintimidacaostrAltAtr]
            									local mod2 = sheet.atributos.modcarisma
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modcarisma;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.intimidacao == true then
            									sheet.pericias.intimidacao = 1
            								end
            								temPericia = sheet.pericias.intimidacao or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusintimidacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusintimidacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusintimidacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusintimidacao = nil;
            								sheet.pericias.bonusintimidacaostr = nil;
            							end;
        end);

    obj._e_event272 = obj.image24:addEventListener("onClick",
        function (event)
            sheet.pericias.persuasao = tonumber(sheet.pericias.persuasao) or 0
            
            				-- Contador que vai de 0 a 1/3 e reseta ao passar de 1/3
            				if ("" == "true") then
            					sheet.pericias.persuasao = (sheet.pericias.persuasao + 1) % 2
            				else 
            					sheet.pericias.persuasao = (sheet.pericias.persuasao + 1) % 4
            				end
        end);

    obj._e_event273 = obj.dataLink77:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet == nil then return end
            				local pics
            
            				if ("" == "true") then
            					pics = {"http://blob.firecast.com.br/blobs/RBKNDVWO_2605563/checkbox2_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/OLODVDPF_2605569/checkbox2_checked.png"}
            				else
            					pics = {"http://blob.firecast.com.br/blobs/RWKSJIFU_781555/checkbox1_unchecked.png", 
            							"http://blob.firecast.com.br/blobs/MQFHLDSL_144272.png",
            							"http://blob.firecast.com.br/blobs/NLIQSGPU_2605567/checkbox1_double_checked.png",
            							"http://blob.firecast.com.br/blobs/HARRKEHM_2605564/checkbox1_half_checked.png"}
            				end;
            
            				local counter = tonumber(sheet.pericias.persuasao) or 0
            				sheet.pericias.persuasaoIcon = pics[counter +1];
        end);

    obj._e_event274 = obj.layout36:addEventListener("onClick",
        function (event)
            Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("Dnd5e.messages.atrCaptionOpt1"), LANG("Dnd5e.messages.atrCaptionOpt2")},
            		               function(selected, selectedIndex, selectedText)
            		                	if selected then
            		                		if selectedIndex==1 then
            		                			Dialogs.choose(LANG("Dnd5e.messages.atrCaption"), {LANG("DnD5e.spells.resistance.str"),LANG("DnD5e.spells.resistance.dex"),LANG("DnD5e.spells.resistance.con"),LANG("DnD5e.spells.resistance.int"),LANG("DnD5e.spells.resistance.wis"),LANG("DnD5e.spells.resistance.cha"),"-"},
            						               function(selected, selectedIndex, selectedText)
            						                	if selected then
            						                		local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma",nil}
            						                		sheet.pericias.bonuspersuasaostrAltAtr = atr[selectedIndex]
            						                	end
            						               end)
            		                		elseif selectedIndex==2 then
            		                			Dialogs.inputQuery(LANG("Dnd5e.messages.atrCaptionOpt2"), "", "1",
            								        function (valorPreenchido)
            								            sheet.pericias.bonuspersuasaostrMinRoll = tonumber(valorPreenchido)
            								        end)
            		                		end
            		                	end
            		               end,1)
        end);

    obj._e_event275 = obj.flpSkillFlowPart24button:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.flpSkillFlowPart24str);
        end);

    obj._e_event276 = obj.flpSkillFlowPart24button:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.flpSkillFlowPart24str);
        end);

    obj._e_event277 = obj.flpSkillFlowPart24button:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.persuasao'}, nil, true);
        end);

    obj._e_event278 = obj.flpSkillFlowPart24button:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.persuasao'}, nil, false);
        end);

    obj._e_event279 = obj.flpSkillFlowPart24button:addEventListener("onMouseEnter",
        function ()
            self.flpSkillFlowPart24button:setFocus();
        end);

    obj._e_event280 = obj.flpSkillFlowPart24button:addEventListener("onExit",
        function ()
            self.flpSkillFlowPart24str.fontColor = "white";
        end);

    obj._e_event281 = obj.dataLink78:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								if sheet.pericias.bonuspersuasaostrAltAtr ~= nil then
            									local mod1 = sheet.atributos["mod"..sheet.pericias.bonuspersuasaostrAltAtr]
            									local mod2 = sheet.atributos.modcarisma
            
            									modificador = math.max(mod1, mod2)
            
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								else
            									modificador = sheet.atributos.modcarisma;
            									
            									if modificador ~= nil then
            										modificador = tonumber(modificador);
            									end;
            								end
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								if sheet.pericias.persuasao == true then
            									sheet.pericias.persuasao = 1
            								end
            								temPericia = sheet.pericias.persuasao or 0;
            							else
            								temPericia = 0;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia == 1 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)
            								elseif temPericia == 2 then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)*2
            								elseif temPericia == 3 then
            									valor = modificador	+ math.floor((tonumber(sheet.bonusProficiencia) or 0)/2)
            								else
            									valor = modificador;
            								end;
            
            								valor = valor + (tonumber(sheet.bonusHabilidades) or 0)			
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonuspersuasao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonuspersuasaostr = "+" .. valor;
            								else
            									sheet.pericias.bonuspersuasaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonuspersuasao = nil;
            								sheet.pericias.bonuspersuasaostr = nil;
            							end;
        end);

    obj._e_event282 = obj.dataLink79:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet==nil then return end
            									if sheet.atributos==nil then return end
            									
            									local modDex = tonumber(sheet.atributos.moddestrezastr) or 0;
            									local dexBonus;
            									
            									if sheet.caEquipDexMode == "heavyArmor" then
            										dexBonus = 0;
            									elseif sheet.caEquipDexMode == "mediumArmor" then
            										dexBonus = math.min(modDex, 2);
            									else
            										dexBonus = modDex;
            									end;
            									
            									sheet.CA = 10 + (tonumber(sheet.caEquip) or 0) + dexBonus;
        end);

    obj._e_event283 = obj.initiativeBut:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.initiativeVal);
        end);

    obj._e_event284 = obj.initiativeBut:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.initiativeVal);
        end);

    obj._e_event285 = obj.initiativeBut:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.rolaIniciativa, nil, nil, true);
        end);

    obj._e_event286 = obj.initiativeBut:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.rolaIniciativa, nil, nil, false);
        end);

    obj._e_event287 = obj.initiativeBut:addEventListener("onMouseEnter",
        function ()
            self.initiativeBut:setFocus();
        end);

    obj._e_event288 = obj.initiativeBut:addEventListener("onExit",
        function ()
            self.initiativeVal.fontColor = "white";
        end);

    obj._e_event289 = obj.button1:addEventListener("onClick",
        function (event)
            Dialogs.inputQuery(LANG("DnD5e.generic.damage"), LANG("DnD5e.message.textPromptDamage"), "",
            									        function (valorPreenchido)
            									            local dano = math.abs(tonumber(valorPreenchido) or 0)
            									            local pvTemp = tonumber(sheet.PVTemporario) or 0
            									            local pv = tonumber(sheet.PV) or 0
            
            									            if dano > pvTemp then
            									            	dano = dano - pvTemp
            									            	sheet.PVTemporario = 0
            
            									            	pv = pv - dano
            									            	sheet.PV = pv
            									            else
            									            	pvTemp = pvTemp - dano
            									            	sheet.PVTemporario = pvTemp
            									            end
            									        end);
        end);

    obj._e_event290 = obj.DeathSave:addEventListener("onKeyDown",
        function (event)
            common.keyDown(sheet, event, self.DeathSave);
        end);

    obj._e_event291 = obj.DeathSave:addEventListener("onKeyUp",
        function (event)
            common.keyUp(sheet, event, self.DeathSave);
        end);

    obj._e_event292 = obj.DeathSave:addEventListener("onClick",
        function (event)
            common.onClick(sheet, common.deathSave, nil, nil, true);
        end);

    obj._e_event293 = obj.DeathSave:addEventListener("onMenu",
        function (x, y, event)
            common.onClick(sheet, common.deathSave, nil, nil, false);
        end);

    obj._e_event294 = obj.DeathSave:addEventListener("onMouseEnter",
        function ()
            self.DeathSave:setFocus();
        end);

    obj._e_event295 = obj.DeathSave:addEventListener("onExit",
        function ()
            self.DeathSave.fontColor = "white";
        end);

    obj._e_event296 = obj.button2:addEventListener("onClick",
        function (event)
            if self.scope.node==nil then return end;
            				toolSheet.filteredMonsters = {};
            				local index = 0;
            
                    for k,v in pairs(monsterListDataS.db) do
                      local monster = monsterListDataS.db[k];
            
                      if toolSheet.enableName then
                          local isName = filterName(monster);
                          if not isName then 
                            --write(monster.name .. " falhou no filtro de isName");
                            goto nextmonster 
                          end;
                        end;
            
                      if toolSheet.enableTypes then
            						local isType = filterType(monster);
            						if not isType then 
            							--write(monster.name .. " falhou no filtro de isType");
            							goto nextmonster 
            						end;
            					end;
                      
                      index = index +1;
            					toolSheet.filteredMonsters[index] = monster;
            					::nextmonster::
            
                    end
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event296);
        __o_rrpgObjs.removeEventListenerById(self._e_event295);
        __o_rrpgObjs.removeEventListenerById(self._e_event294);
        __o_rrpgObjs.removeEventListenerById(self._e_event293);
        __o_rrpgObjs.removeEventListenerById(self._e_event292);
        __o_rrpgObjs.removeEventListenerById(self._e_event291);
        __o_rrpgObjs.removeEventListenerById(self._e_event290);
        __o_rrpgObjs.removeEventListenerById(self._e_event289);
        __o_rrpgObjs.removeEventListenerById(self._e_event288);
        __o_rrpgObjs.removeEventListenerById(self._e_event287);
        __o_rrpgObjs.removeEventListenerById(self._e_event286);
        __o_rrpgObjs.removeEventListenerById(self._e_event285);
        __o_rrpgObjs.removeEventListenerById(self._e_event284);
        __o_rrpgObjs.removeEventListenerById(self._e_event283);
        __o_rrpgObjs.removeEventListenerById(self._e_event282);
        __o_rrpgObjs.removeEventListenerById(self._e_event281);
        __o_rrpgObjs.removeEventListenerById(self._e_event280);
        __o_rrpgObjs.removeEventListenerById(self._e_event279);
        __o_rrpgObjs.removeEventListenerById(self._e_event278);
        __o_rrpgObjs.removeEventListenerById(self._e_event277);
        __o_rrpgObjs.removeEventListenerById(self._e_event276);
        __o_rrpgObjs.removeEventListenerById(self._e_event275);
        __o_rrpgObjs.removeEventListenerById(self._e_event274);
        __o_rrpgObjs.removeEventListenerById(self._e_event273);
        __o_rrpgObjs.removeEventListenerById(self._e_event272);
        __o_rrpgObjs.removeEventListenerById(self._e_event271);
        __o_rrpgObjs.removeEventListenerById(self._e_event270);
        __o_rrpgObjs.removeEventListenerById(self._e_event269);
        __o_rrpgObjs.removeEventListenerById(self._e_event268);
        __o_rrpgObjs.removeEventListenerById(self._e_event267);
        __o_rrpgObjs.removeEventListenerById(self._e_event266);
        __o_rrpgObjs.removeEventListenerById(self._e_event265);
        __o_rrpgObjs.removeEventListenerById(self._e_event264);
        __o_rrpgObjs.removeEventListenerById(self._e_event263);
        __o_rrpgObjs.removeEventListenerById(self._e_event262);
        __o_rrpgObjs.removeEventListenerById(self._e_event261);
        __o_rrpgObjs.removeEventListenerById(self._e_event260);
        __o_rrpgObjs.removeEventListenerById(self._e_event259);
        __o_rrpgObjs.removeEventListenerById(self._e_event258);
        __o_rrpgObjs.removeEventListenerById(self._e_event257);
        __o_rrpgObjs.removeEventListenerById(self._e_event256);
        __o_rrpgObjs.removeEventListenerById(self._e_event255);
        __o_rrpgObjs.removeEventListenerById(self._e_event254);
        __o_rrpgObjs.removeEventListenerById(self._e_event253);
        __o_rrpgObjs.removeEventListenerById(self._e_event252);
        __o_rrpgObjs.removeEventListenerById(self._e_event251);
        __o_rrpgObjs.removeEventListenerById(self._e_event250);
        __o_rrpgObjs.removeEventListenerById(self._e_event249);
        __o_rrpgObjs.removeEventListenerById(self._e_event248);
        __o_rrpgObjs.removeEventListenerById(self._e_event247);
        __o_rrpgObjs.removeEventListenerById(self._e_event246);
        __o_rrpgObjs.removeEventListenerById(self._e_event245);
        __o_rrpgObjs.removeEventListenerById(self._e_event244);
        __o_rrpgObjs.removeEventListenerById(self._e_event243);
        __o_rrpgObjs.removeEventListenerById(self._e_event242);
        __o_rrpgObjs.removeEventListenerById(self._e_event241);
        __o_rrpgObjs.removeEventListenerById(self._e_event240);
        __o_rrpgObjs.removeEventListenerById(self._e_event239);
        __o_rrpgObjs.removeEventListenerById(self._e_event238);
        __o_rrpgObjs.removeEventListenerById(self._e_event237);
        __o_rrpgObjs.removeEventListenerById(self._e_event236);
        __o_rrpgObjs.removeEventListenerById(self._e_event235);
        __o_rrpgObjs.removeEventListenerById(self._e_event234);
        __o_rrpgObjs.removeEventListenerById(self._e_event233);
        __o_rrpgObjs.removeEventListenerById(self._e_event232);
        __o_rrpgObjs.removeEventListenerById(self._e_event231);
        __o_rrpgObjs.removeEventListenerById(self._e_event230);
        __o_rrpgObjs.removeEventListenerById(self._e_event229);
        __o_rrpgObjs.removeEventListenerById(self._e_event228);
        __o_rrpgObjs.removeEventListenerById(self._e_event227);
        __o_rrpgObjs.removeEventListenerById(self._e_event226);
        __o_rrpgObjs.removeEventListenerById(self._e_event225);
        __o_rrpgObjs.removeEventListenerById(self._e_event224);
        __o_rrpgObjs.removeEventListenerById(self._e_event223);
        __o_rrpgObjs.removeEventListenerById(self._e_event222);
        __o_rrpgObjs.removeEventListenerById(self._e_event221);
        __o_rrpgObjs.removeEventListenerById(self._e_event220);
        __o_rrpgObjs.removeEventListenerById(self._e_event219);
        __o_rrpgObjs.removeEventListenerById(self._e_event218);
        __o_rrpgObjs.removeEventListenerById(self._e_event217);
        __o_rrpgObjs.removeEventListenerById(self._e_event216);
        __o_rrpgObjs.removeEventListenerById(self._e_event215);
        __o_rrpgObjs.removeEventListenerById(self._e_event214);
        __o_rrpgObjs.removeEventListenerById(self._e_event213);
        __o_rrpgObjs.removeEventListenerById(self._e_event212);
        __o_rrpgObjs.removeEventListenerById(self._e_event211);
        __o_rrpgObjs.removeEventListenerById(self._e_event210);
        __o_rrpgObjs.removeEventListenerById(self._e_event209);
        __o_rrpgObjs.removeEventListenerById(self._e_event208);
        __o_rrpgObjs.removeEventListenerById(self._e_event207);
        __o_rrpgObjs.removeEventListenerById(self._e_event206);
        __o_rrpgObjs.removeEventListenerById(self._e_event205);
        __o_rrpgObjs.removeEventListenerById(self._e_event204);
        __o_rrpgObjs.removeEventListenerById(self._e_event203);
        __o_rrpgObjs.removeEventListenerById(self._e_event202);
        __o_rrpgObjs.removeEventListenerById(self._e_event201);
        __o_rrpgObjs.removeEventListenerById(self._e_event200);
        __o_rrpgObjs.removeEventListenerById(self._e_event199);
        __o_rrpgObjs.removeEventListenerById(self._e_event198);
        __o_rrpgObjs.removeEventListenerById(self._e_event197);
        __o_rrpgObjs.removeEventListenerById(self._e_event196);
        __o_rrpgObjs.removeEventListenerById(self._e_event195);
        __o_rrpgObjs.removeEventListenerById(self._e_event194);
        __o_rrpgObjs.removeEventListenerById(self._e_event193);
        __o_rrpgObjs.removeEventListenerById(self._e_event192);
        __o_rrpgObjs.removeEventListenerById(self._e_event191);
        __o_rrpgObjs.removeEventListenerById(self._e_event190);
        __o_rrpgObjs.removeEventListenerById(self._e_event189);
        __o_rrpgObjs.removeEventListenerById(self._e_event188);
        __o_rrpgObjs.removeEventListenerById(self._e_event187);
        __o_rrpgObjs.removeEventListenerById(self._e_event186);
        __o_rrpgObjs.removeEventListenerById(self._e_event185);
        __o_rrpgObjs.removeEventListenerById(self._e_event184);
        __o_rrpgObjs.removeEventListenerById(self._e_event183);
        __o_rrpgObjs.removeEventListenerById(self._e_event182);
        __o_rrpgObjs.removeEventListenerById(self._e_event181);
        __o_rrpgObjs.removeEventListenerById(self._e_event180);
        __o_rrpgObjs.removeEventListenerById(self._e_event179);
        __o_rrpgObjs.removeEventListenerById(self._e_event178);
        __o_rrpgObjs.removeEventListenerById(self._e_event177);
        __o_rrpgObjs.removeEventListenerById(self._e_event176);
        __o_rrpgObjs.removeEventListenerById(self._e_event175);
        __o_rrpgObjs.removeEventListenerById(self._e_event174);
        __o_rrpgObjs.removeEventListenerById(self._e_event173);
        __o_rrpgObjs.removeEventListenerById(self._e_event172);
        __o_rrpgObjs.removeEventListenerById(self._e_event171);
        __o_rrpgObjs.removeEventListenerById(self._e_event170);
        __o_rrpgObjs.removeEventListenerById(self._e_event169);
        __o_rrpgObjs.removeEventListenerById(self._e_event168);
        __o_rrpgObjs.removeEventListenerById(self._e_event167);
        __o_rrpgObjs.removeEventListenerById(self._e_event166);
        __o_rrpgObjs.removeEventListenerById(self._e_event165);
        __o_rrpgObjs.removeEventListenerById(self._e_event164);
        __o_rrpgObjs.removeEventListenerById(self._e_event163);
        __o_rrpgObjs.removeEventListenerById(self._e_event162);
        __o_rrpgObjs.removeEventListenerById(self._e_event161);
        __o_rrpgObjs.removeEventListenerById(self._e_event160);
        __o_rrpgObjs.removeEventListenerById(self._e_event159);
        __o_rrpgObjs.removeEventListenerById(self._e_event158);
        __o_rrpgObjs.removeEventListenerById(self._e_event157);
        __o_rrpgObjs.removeEventListenerById(self._e_event156);
        __o_rrpgObjs.removeEventListenerById(self._e_event155);
        __o_rrpgObjs.removeEventListenerById(self._e_event154);
        __o_rrpgObjs.removeEventListenerById(self._e_event153);
        __o_rrpgObjs.removeEventListenerById(self._e_event152);
        __o_rrpgObjs.removeEventListenerById(self._e_event151);
        __o_rrpgObjs.removeEventListenerById(self._e_event150);
        __o_rrpgObjs.removeEventListenerById(self._e_event149);
        __o_rrpgObjs.removeEventListenerById(self._e_event148);
        __o_rrpgObjs.removeEventListenerById(self._e_event147);
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.flpSkillFlowPart9str ~= nil then self.flpSkillFlowPart9str:destroy(); self.flpSkillFlowPart9str = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.UpperGridCampo5 ~= nil then self.UpperGridCampo5:destroy(); self.UpperGridCampo5 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.modcarismastr ~= nil then self.modcarismastr:destroy(); self.modcarismastr = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.horzLine17 ~= nil then self.horzLine17:destroy(); self.horzLine17 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.flpSkillFlowPart7str ~= nil then self.flpSkillFlowPart7str:destroy(); self.flpSkillFlowPart7str = nil; end;
        if self.flpSkillFlowPart5str ~= nil then self.flpSkillFlowPart5str:destroy(); self.flpSkillFlowPart5str = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.flpSkillFlowPart3str ~= nil then self.flpSkillFlowPart3str:destroy(); self.flpSkillFlowPart3str = nil; end;
        if self.flpSkillFlowPart1str ~= nil then self.flpSkillFlowPart1str:destroy(); self.flpSkillFlowPart1str = nil; end;
        if self.horzLine26 ~= nil then self.horzLine26:destroy(); self.horzLine26 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.flpSkillFlowPart1 ~= nil then self.flpSkillFlowPart1:destroy(); self.flpSkillFlowPart1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.horzLine19 ~= nil then self.horzLine19:destroy(); self.horzLine19 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.flwNome1 ~= nil then self.flwNome1:destroy(); self.flwNome1 = nil; end;
        if self.flpSkillFlowPart6str ~= nil then self.flpSkillFlowPart6str:destroy(); self.flpSkillFlowPart6str = nil; end;
        if self.flpSkillFlowPart4str ~= nil then self.flpSkillFlowPart4str:destroy(); self.flpSkillFlowPart4str = nil; end;
        if self.labUpperGridCampo3 ~= nil then self.labUpperGridCampo3:destroy(); self.labUpperGridCampo3 = nil; end;
        if self.flpSkillFlowPart2str ~= nil then self.flpSkillFlowPart2str:destroy(); self.flpSkillFlowPart2str = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.flpSkillFlowPart8button ~= nil then self.flpSkillFlowPart8button:destroy(); self.flpSkillFlowPart8button = nil; end;
        if self.flpSkillFlowPart4 ~= nil then self.flpSkillFlowPart4:destroy(); self.flpSkillFlowPart4 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.horzLine23 ~= nil then self.horzLine23:destroy(); self.horzLine23 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.flpSkillFlowPart13 ~= nil then self.flpSkillFlowPart13:destroy(); self.flpSkillFlowPart13 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.flpSkillFlowPart23 ~= nil then self.flpSkillFlowPart23:destroy(); self.flpSkillFlowPart23 = nil; end;
        if self.frame2 ~= nil then self.frame2:destroy(); self.frame2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.flpSkillFlowPart8str ~= nil then self.flpSkillFlowPart8str:destroy(); self.flpSkillFlowPart8str = nil; end;
        if self.flpSkillFlowPart14 ~= nil then self.flpSkillFlowPart14:destroy(); self.flpSkillFlowPart14 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.edtUpperGridCampo3 ~= nil then self.edtUpperGridCampo3:destroy(); self.edtUpperGridCampo3 = nil; end;
        if self.flpSkillFlowPart7button ~= nil then self.flpSkillFlowPart7button:destroy(); self.flpSkillFlowPart7button = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.linUpperGridCampo4 ~= nil then self.linUpperGridCampo4:destroy(); self.linUpperGridCampo4 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.labNome1 ~= nil then self.labNome1:destroy(); self.labNome1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.edtUpperGridCampo4 ~= nil then self.edtUpperGridCampo4:destroy(); self.edtUpperGridCampo4 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.linUpperGridCampo1 ~= nil then self.linUpperGridCampo1:destroy(); self.linUpperGridCampo1 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.flpSkillFlowPart2button ~= nil then self.flpSkillFlowPart2button:destroy(); self.flpSkillFlowPart2button = nil; end;
        if self.initiativeVal ~= nil then self.initiativeVal:destroy(); self.initiativeVal = nil; end;
        if self.UpperGridCampo4 ~= nil then self.UpperGridCampo4:destroy(); self.UpperGridCampo4 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.flpSkillFlowPart9button ~= nil then self.flpSkillFlowPart9button:destroy(); self.flpSkillFlowPart9button = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.flpSkillFlowPart18str ~= nil then self.flpSkillFlowPart18str:destroy(); self.flpSkillFlowPart18str = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.fraLayAtributos ~= nil then self.fraLayAtributos:destroy(); self.fraLayAtributos = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.moddestrezastr ~= nil then self.moddestrezastr:destroy(); self.moddestrezastr = nil; end;
        if self.horzLine18 ~= nil then self.horzLine18:destroy(); self.horzLine18 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.modforcastr ~= nil then self.modforcastr:destroy(); self.modforcastr = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.labUpperGridCampo4 ~= nil then self.labUpperGridCampo4:destroy(); self.labUpperGridCampo4 = nil; end;
        if self.flpSkillFlowPart11button ~= nil then self.flpSkillFlowPart11button:destroy(); self.flpSkillFlowPart11button = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.horzLine20 ~= nil then self.horzLine20:destroy(); self.horzLine20 = nil; end;
        if self.flpSkillFlowPart21str ~= nil then self.flpSkillFlowPart21str:destroy(); self.flpSkillFlowPart21str = nil; end;
        if self.flpSkillFlowPart16str ~= nil then self.flpSkillFlowPart16str:destroy(); self.flpSkillFlowPart16str = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.flpSkillFlowPart12str ~= nil then self.flpSkillFlowPart12str:destroy(); self.flpSkillFlowPart12str = nil; end;
        if self.flpSkillFlowPart14str ~= nil then self.flpSkillFlowPart14str:destroy(); self.flpSkillFlowPart14str = nil; end;
        if self.flpSkillFlowPart10str ~= nil then self.flpSkillFlowPart10str:destroy(); self.flpSkillFlowPart10str = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.flpSkillFlowPart10 ~= nil then self.flpSkillFlowPart10:destroy(); self.flpSkillFlowPart10 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.flpSkillFlowPart22 ~= nil then self.flpSkillFlowPart22:destroy(); self.flpSkillFlowPart22 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.flpSkillFlowPart17str ~= nil then self.flpSkillFlowPart17str:destroy(); self.flpSkillFlowPart17str = nil; end;
        if self.DeathSave ~= nil then self.DeathSave:destroy(); self.DeathSave = nil; end;
        if self.flpSkillFlowPart15str ~= nil then self.flpSkillFlowPart15str:destroy(); self.flpSkillFlowPart15str = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.flpSkillFlowPart13str ~= nil then self.flpSkillFlowPart13str:destroy(); self.flpSkillFlowPart13str = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.flpSkillFlowPart11str ~= nil then self.flpSkillFlowPart11str:destroy(); self.flpSkillFlowPart11str = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.flpSkillFlowPart15 ~= nil then self.flpSkillFlowPart15:destroy(); self.flpSkillFlowPart15 = nil; end;
        if self.flpSkillFlowPart19button ~= nil then self.flpSkillFlowPart19button:destroy(); self.flpSkillFlowPart19button = nil; end;
        if self.fraFrenteLayout ~= nil then self.fraFrenteLayout:destroy(); self.fraFrenteLayout = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.linUpperGridCampo5 ~= nil then self.linUpperGridCampo5:destroy(); self.linUpperGridCampo5 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.modsabedoriabutton ~= nil then self.modsabedoriabutton:destroy(); self.modsabedoriabutton = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edtUpperGridCampo5 ~= nil then self.edtUpperGridCampo5:destroy(); self.edtUpperGridCampo5 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.linUpperGridCampo2 ~= nil then self.linUpperGridCampo2:destroy(); self.linUpperGridCampo2 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.modinteligenciabutton ~= nil then self.modinteligenciabutton:destroy(); self.modinteligenciabutton = nil; end;
        if self.flpSkillFlowPart16button ~= nil then self.flpSkillFlowPart16button:destroy(); self.flpSkillFlowPart16button = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.flpSkillFlowPart19str ~= nil then self.flpSkillFlowPart19str:destroy(); self.flpSkillFlowPart19str = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.UpperGridCampo3 ~= nil then self.UpperGridCampo3:destroy(); self.UpperGridCampo3 = nil; end;
        if self.flpSkillFlowPart23button ~= nil then self.flpSkillFlowPart23button:destroy(); self.flpSkillFlowPart23button = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.flpSkillFlowPart9 ~= nil then self.flpSkillFlowPart9:destroy(); self.flpSkillFlowPart9 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.flpSkillFlowPart24str ~= nil then self.flpSkillFlowPart24str:destroy(); self.flpSkillFlowPart24str = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.flpSkillFlowPart20str ~= nil then self.flpSkillFlowPart20str:destroy(); self.flpSkillFlowPart20str = nil; end;
        if self.flpSkillFlowPart13button ~= nil then self.flpSkillFlowPart13button:destroy(); self.flpSkillFlowPart13button = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.modconstituicaobutton ~= nil then self.modconstituicaobutton:destroy(); self.modconstituicaobutton = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.flpSkillFlowPart4button ~= nil then self.flpSkillFlowPart4button:destroy(); self.flpSkillFlowPart4button = nil; end;
        if self.horzLine24 ~= nil then self.horzLine24:destroy(); self.horzLine24 = nil; end;
        if self.flpSkillFlowPart7 ~= nil then self.flpSkillFlowPart7:destroy(); self.flpSkillFlowPart7 = nil; end;
        if self.flpSkillFlowPart18button ~= nil then self.flpSkillFlowPart18button:destroy(); self.flpSkillFlowPart18button = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.flpSkillFlowPart5button ~= nil then self.flpSkillFlowPart5button:destroy(); self.flpSkillFlowPart5button = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.labUpperGridCampo5 ~= nil then self.labUpperGridCampo5:destroy(); self.labUpperGridCampo5 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.horzLine21 ~= nil then self.horzLine21:destroy(); self.horzLine21 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.moddestrezabutton ~= nil then self.moddestrezabutton:destroy(); self.moddestrezabutton = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flpSkillFlowPart11 ~= nil then self.flpSkillFlowPart11:destroy(); self.flpSkillFlowPart11 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.edtUpperGridCampo1 ~= nil then self.edtUpperGridCampo1:destroy(); self.edtUpperGridCampo1 = nil; end;
        if self.flpSkillFlowPart1button ~= nil then self.flpSkillFlowPart1button:destroy(); self.flpSkillFlowPart1button = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.linUpperGridCampo6 ~= nil then self.linUpperGridCampo6:destroy(); self.linUpperGridCampo6 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.popDescrition ~= nil then self.popDescrition:destroy(); self.popDescrition = nil; end;
        if self.linUpperGridCampo3 ~= nil then self.linUpperGridCampo3:destroy(); self.linUpperGridCampo3 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.UpperGridCampo2 ~= nil then self.UpperGridCampo2:destroy(); self.UpperGridCampo2 = nil; end;
        if self.initiativeBut ~= nil then self.initiativeBut:destroy(); self.initiativeBut = nil; end;
        if self.flpSkillFlowPart6button ~= nil then self.flpSkillFlowPart6button:destroy(); self.flpSkillFlowPart6button = nil; end;
        if self.flpSkillFlowPart8 ~= nil then self.flpSkillFlowPart8:destroy(); self.flpSkillFlowPart8 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.modforcabutton ~= nil then self.modforcabutton:destroy(); self.modforcabutton = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.flpSkillFlowPart3 ~= nil then self.flpSkillFlowPart3:destroy(); self.flpSkillFlowPart3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.labUpperGridCampo1 ~= nil then self.labUpperGridCampo1:destroy(); self.labUpperGridCampo1 = nil; end;
        if self.flpSkillFlowPart18 ~= nil then self.flpSkillFlowPart18:destroy(); self.flpSkillFlowPart18 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.horzLine25 ~= nil then self.horzLine25:destroy(); self.horzLine25 = nil; end;
        if self.flpSkillFlowPart6 ~= nil then self.flpSkillFlowPart6:destroy(); self.flpSkillFlowPart6 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.modcarismabutton ~= nil then self.modcarismabutton:destroy(); self.modcarismabutton = nil; end;
        if self.labUpperGridCampo6 ~= nil then self.labUpperGridCampo6:destroy(); self.labUpperGridCampo6 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.flpSkillFlowPart21 ~= nil then self.flpSkillFlowPart21:destroy(); self.flpSkillFlowPart21 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.flpSkillFlowPart3button ~= nil then self.flpSkillFlowPart3button:destroy(); self.flpSkillFlowPart3button = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edtNome1 ~= nil then self.edtNome1:destroy(); self.edtNome1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.flpSkillFlowPart15button ~= nil then self.flpSkillFlowPart15button:destroy(); self.flpSkillFlowPart15button = nil; end;
        if self.flpSkillFlowPart16 ~= nil then self.flpSkillFlowPart16:destroy(); self.flpSkillFlowPart16 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.flpSkillFlowPart14button ~= nil then self.flpSkillFlowPart14button:destroy(); self.flpSkillFlowPart14button = nil; end;
        if self.flpSkillFlowPart24 ~= nil then self.flpSkillFlowPart24:destroy(); self.flpSkillFlowPart24 = nil; end;
        if self.flpSkillFlowPart24button ~= nil then self.flpSkillFlowPart24button:destroy(); self.flpSkillFlowPart24button = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edtUpperGridCampo6 ~= nil then self.edtUpperGridCampo6:destroy(); self.edtUpperGridCampo6 = nil; end;
        if self.modinteligenciastr ~= nil then self.modinteligenciastr:destroy(); self.modinteligenciastr = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.fraUpperGridFrente ~= nil then self.fraUpperGridFrente:destroy(); self.fraUpperGridFrente = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.flpSkillFlowPart22button ~= nil then self.flpSkillFlowPart22button:destroy(); self.flpSkillFlowPart22button = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.flpSkillFlowPart23str ~= nil then self.flpSkillFlowPart23str:destroy(); self.flpSkillFlowPart23str = nil; end;
        if self.UpperGridCampo6 ~= nil then self.UpperGridCampo6:destroy(); self.UpperGridCampo6 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.flpSkillFlowPart10button ~= nil then self.flpSkillFlowPart10button:destroy(); self.flpSkillFlowPart10button = nil; end;
        if self.flpSkillFlowPart20button ~= nil then self.flpSkillFlowPart20button:destroy(); self.flpSkillFlowPart20button = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.UpperGridCampo1 ~= nil then self.UpperGridCampo1:destroy(); self.UpperGridCampo1 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.flpSkillFlowPart2 ~= nil then self.flpSkillFlowPart2:destroy(); self.flpSkillFlowPart2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.labUpperGridCampo2 ~= nil then self.labUpperGridCampo2:destroy(); self.labUpperGridCampo2 = nil; end;
        if self.flpSkillFlowPart17button ~= nil then self.flpSkillFlowPart17button:destroy(); self.flpSkillFlowPart17button = nil; end;
        if self.flpSkillFlowPart19 ~= nil then self.flpSkillFlowPart19:destroy(); self.flpSkillFlowPart19 = nil; end;
        if self.horzLine22 ~= nil then self.horzLine22:destroy(); self.horzLine22 = nil; end;
        if self.layNomeHolderFrente ~= nil then self.layNomeHolderFrente:destroy(); self.layNomeHolderFrente = nil; end;
        if self.flpSkillFlowPart5 ~= nil then self.flpSkillFlowPart5:destroy(); self.flpSkillFlowPart5 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.flpSkillFlowPart12 ~= nil then self.flpSkillFlowPart12:destroy(); self.flpSkillFlowPart12 = nil; end;
        if self.flpSkillFlowPart20 ~= nil then self.flpSkillFlowPart20:destroy(); self.flpSkillFlowPart20 = nil; end;
        if self.frame1 ~= nil then self.frame1:destroy(); self.frame1 = nil; end;
        if self.frmMonster ~= nil then self.frmMonster:destroy(); self.frmMonster = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.flpSkillFlowPart17 ~= nil then self.flpSkillFlowPart17:destroy(); self.flpSkillFlowPart17 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.edtUpperGridCampo2 ~= nil then self.edtUpperGridCampo2:destroy(); self.edtUpperGridCampo2 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flpSkillFlowPart21button ~= nil then self.flpSkillFlowPart21button:destroy(); self.flpSkillFlowPart21button = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.flpSkillFlowPart22str ~= nil then self.flpSkillFlowPart22str:destroy(); self.flpSkillFlowPart22str = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flpSkillFlowPart12button ~= nil then self.flpSkillFlowPart12button:destroy(); self.flpSkillFlowPart12button = nil; end;
        if self.modconstituicaostr ~= nil then self.modconstituicaostr:destroy(); self.modconstituicaostr = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.modsabedoriastr ~= nil then self.modsabedoriastr:destroy(); self.modsabedoriastr = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMonstersDnD5()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMonstersDnD5();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMonstersDnD5 = {
    newEditor = newfrmMonstersDnD5, 
    new = newfrmMonstersDnD5, 
    name = "frmMonstersDnD5", 
    dataType = "marcos_monsters_2025", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "time", 
    title = "Ficha de Monstros D&D do Marcão", 
    description="@@dnd.sheet.description"};

frmMonstersDnD5 = _frmMonstersDnD5;
Firecast.registrarForm(_frmMonstersDnD5);
Firecast.registrarDataType(_frmMonstersDnD5);

return _frmMonstersDnD5;
