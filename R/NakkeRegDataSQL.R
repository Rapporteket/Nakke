#' Henter data registrert for Degenerativ Nakke
#'
#' Henter data for Degenerativ Nakke fra "staging"-database.
#' Kan benytte datoFra og datoFra som input.
#'
#' @inheritParams NakkeFigAndeler
#'
#' @return Henter dataramma RegData for Degenerativ Nakke
#' @export
#'
NakkeRegDataSQL <- function(datoFra = '2012-01-01', datoTil = '2099-01-01') {

  query <- paste0('SELECT
	Alder,
	AndreRelSykdommer,
	AntallNivaaOpr,
	AntBarn,
	AntBarnPas,
	Antibiotika,
	Arbeidstaus12mnd,
	Arbeidstaus3mnd,
	ArbeidstausPreOp,
	ASAgrad,
	AvdRESH,
	BakreFusjonSkruer,
	BakreFusjonStag,
	BakreFusjonWire,
	BMI,
	BMIkategori,
	CentreID12mnd,
	CentreID3mnd,
	Dagkirurgi,
	DelvisSykemeldtPros12mnd,
	DelvisSykemeldtPros3mnd,
	DelvisSykemeldtProsPreOp,
	EMSscore12mnd,
	EMSscore3mnd,
	EMSscorePreOp,
	EnhverKompl12mnd,
	EnhverKompl3mnd,
	EqAngstPreOp,
	Eq5DScore12mnd,
	Eq5DScore3mnd,
	Eq5DScorePreOp,
	Erstatning12mnd,
	Erstatning3mnd,
	ErstatningPreOp,
	-- FirstTimeClosed,
	ForlopsID,
	FornoydBeh12mnd,
	FornoydBeh3mnd,
	Fylke,
	Helsetilst12mnd,
	Helsetilst3mnd,
	HelsetilstPreOp,
	Hoyde,
	InngrepType,
	Kjonn,
	KnivtidSluttMin,
	KnivtidSluttTimer,
	KnivtidStartMin,
	KnivtidStartTimer,
	KnivtidTotalMin,
	KomplDVT12mnd,
	KomplDVT3mnd,
	KomplinfekDyp12mnd,
	KomplinfekDyp3mnd,
	KomplinfekOverfl12mnd,
	KomplinfekOverfl3mnd,
	KomplKraftsvikt12mnd,
	KomplKraftsvikt3mnd,
	KomplLungeEmboli12mnd,
	KomplLungeEmboli3mnd,
	KomplPneumoni12mnd,
	KomplPneumoni3mnd,
	KomplStemme12mnd,
	KomplStemme3mnd,
	KomplSvelging12mnd,
	KomplSvelging3mnd,
	KomplUVI12mnd,
	KomplUVI3mnd,
	LegeskjemaStatus,
	LiggeDognPostop,
	LiggeDognTotalt,
	Morsmal,
	NDIscore12mnd,
	NDIscore3mnd,
	NDIscorePreOp,
  NRSsmerteArmPreOp,
	NRSsmerteArm12mnd,
  NRSsmerteArm3mnd,
  NRSsmerteNakkePreOp,
  NRSsmerteNakke12mnd,
	NRSsmerteNakke3mnd,
	NytteOpr12mnd,
	NytteOpr3mnd,
	OperasjonsKategori,
	OppFolgStatus12mnd,
	OppFolgStatus3mnd,
	OprDato,
	OprIndikAnnet,
	OprIndikasjon,
	OprIndikMyelopati,
	OprIndikMyelopatiMotorisk,
	OprIndikMyelopatiSensorisk,
	OprIndikParese,
	OprIndikPareseGrad,
	OprIndikSmerteLokArm,
	OprIndikSmerteLokNakke,
	OprIndikSmerter,
	OprKode,
	OprMetodeAndre,
	OprMetodeAnnenBakreDekompr,
	OprMetodeBakreFusjon,
	OprMetodeDiskektomi,
	OprMetodeDiskektomiBenblokk,
	OprMetodeDiskektomiCage,
	OprMetodeDiskektomiPlate,
	OprMetodeDiskektomiSkiveprotese,
	OprMetodeForamenotomiBakreBiLat,
	OprMetodeForamenotomiBakreUniLat,
	OprMetodeKirDekompresjon,
	OprMetodeKorpektomi,
  OprMetodeTilgangBakre,
  OprMetodeTilgangFremre,
  OprMetodeTilgangFremreH,
  OprMetodeTilgangFremreV,
	Parese12mnd,
	Parese3mnd,
	ParesePreOp,
	PareseVarighet,
	PasientID,
	PasientSkjemaStatus,
	PerOpKomplAnafylaksiI,
	PerOpKomplAnnet,
	PerOpKomplBlodning,
	PerOpKomplDurarift,
  PerOpKomplFeilplasseringImplant,
  PerOpKomplKardioVaskulare,
  PerOpKomplMedullaskade,
  PerOpKomplNerverotSkade,
  PerOpKomplAnnenNerveskade,
  PerOpKomplOpFeilNivaa,
  PerOpKomplRespiratorisk,
  PerOpKomplOsofagusSkade,
  PerOpEnhverKompl
	PerOpEnhverKompl,
	RadiologiCt,
	RadiologiMr,
	RadiologiMyelografi,
	RadiologiRtgCcol,
	RadiologiRtgCcolFunkOpptak,
	Reopr90d,
	Roker,
	RtgFunnANNET,
	RtgFunnCervicalSpStenose,
	RtgFunnDegnerasjonNakke,
	RtgFunnProlaps,
	RtgFunnRotkanalstenose,
	Saardren,
	SivilStatus,
	SivilStatusPas,
	SmertestillBrukPreOp,
	SmertestillPreOp,
	Snuser,
	SnuserPas,
	StatusKtr12mnd,
	StatusKtr3mnd,
	SykdAnnenendokrin,
	SykdAnnet,
	SykdCarpalTunnelSyndr,
	SykdCerebrovaskular,
  SykdDepresjonAngst,
  SykdHjertekar,
  SykdHodepine,
  SykdHypertensjon,
	SykDiabetesMellitus,
	SykdKreft,
	SykdKroniskLunge,
	SykdKroniskNevrologisk,
	SykdKrSmerterMuskelSkjelSyst,
	SykdOsteoporose,
	SykdSkulderImpigment,
	SykdWhiplashNakke,
	SykehusNavn,
	SymptVarighetArmer,
	SymptVarighetNakkeHode,
	SymptVarighetSmerterUker,
	TidlOpr,
	TidlOprAnnetNiv,
	TidlOprAntall,
	TidlOprNei,
	TidlOprSammeNiv,
	Uforetrygd12mnd,
	Uforetrygd3mnd,
	UforetrygdPreOp,
	UforeTrygdPros3mnd,
	UforeTrygdProsPreOp,
	Utdanning,
	UtdanningPas,
	UtDato,
	VarighetSykeMeld12mnd,
	VarighetSykeMeld3mnd,
	Vekt
FROM AlleVarNum
                  WHERE OprDato >= \'', datoFra, '\' AND OprDato <= \'', datoTil, '\'')

  #query <-'select * from AlleVarNum'

  RegData <- rapbase::loadRegData(registryName = "nakke", query = query, dbType = "mysql")

#FROM AlleVarNum INNER JOIN ForlopsOversikt ON AlleVarNum.MCEID = ForlopsOversikt.ForlopsID
#Tatt ut, mai 2017:
	#AVD_RESH,Avdeling,CentreIdPas,HelsetilstPreOpMissing,HoydeMissing,MceCentreID,OprIndikasjonUtfylt,ORG_RESH,
	#	Organisasjon,RadiologiUndersokelseUtfylt,RHF,RHF_RESH,VektMissing)


return(RegData)
}



