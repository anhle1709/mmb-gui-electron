//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: EA_PV17
// QUEST3 extension with short-term and long-term government bonds and EA CB bond purchases
// Cross-border holding (EA-RoW) of long-term government bonds
// Romanos Priftis & Lukas Vogel, 2017. "The macroeconomic effects of the ECB�s evolving QE programme: a model-based analysis," Open Economies Review, vol. 28(5), pages 823-845. 

//List of enogenous variables (EA = EA, equivalent for R_ = RoW)

// Last edited: 20.02.2019 by F. Strobel

/*
ea_b = nom gov debt
ea_ben = unemployment benefits
EA_bl = long-term bonds (bl)
EA_blcb = bl held by CB
EA_blnlc = bl held by private sector
EA_blnlcd = bl held by domestic private sector
EA_blnlcf = bl held by foreign private sector
ea_br = real gov debt
EA_bs = short-term bonds
ea_bw = nom NFA
ea_bwr = real NFA
ea_by = gov debt to GDP
ea_c = real total consumprion (c)
ea_cay = current account to GDP
ea_clc = real liquidity-constrained c (LC)
ea_cnlc = real Ricardian c (NLC)
ea_db = first difference b
EA_dbl = first difference bl
EA_dblcb = first difference blcb
EA_dblnlcf = first difference blnlcf
ea_dbr = first difference br
EA_dbs = first difference bs
ea_dbwr = first difference bwr
ea_dc = first difference c
ea_dcnlc = first difference cnlc
ea_de = first difference e
ea_dex = first difference ex
ea_dexl = first difference exl
ea_dexr = first difference exr
ea_dexucap = first difference exucap
ea_dgs = first difference gs
ea_di = first difference i
ea_digs = first difference igs
ea_dim = first difference im
ea_dinfc = first difference infc
ea_dinfx = first difference infx
ea_dinfy = first difference infy
ea_dinom = first difference inom
ea_dk = first difference k
ea_dkg = first difference kg
ea_dl = first difference l
ea_dlamlc = first difference lamlc
ea_dlamnlc = first difference lamnlc
ea_dltfp = first difference ltfp
EA_dm = first difference m
ea_dnomint = first difference nomint
ea_doil = first difference oil
EA_dpbl = first difference pbl
ea_dpim = first difference pim
ea_dpx = first difference px
ea_dpy = first difference py
ea_dq = first difference q 
ea_dr = first difference r 
ea_drealint = first difference realint
ea_dtl = first difference tl 
ea_dv = first difference v
ea_dwinf = first difference winf  
ea_dwr = first difference wr 
ea_dy = first difference y 
ea_e = nom exchange rate EA to ROW
ea_eps_gs = shock to gs 
ea_eps_igs = shock to igs 
ea_eta = price mark-up 
ea_ex = real exports 
ea_ex_l = trend employment
ea_ex_r = trend real rate 
ea_ex_ucap= trend capacity utilisation
ea_f = financial wealth
ea_gby = gov balance to GDP
ea_gs = gov consumption to GDP 
ea_i = real private investment
ea_igs = gov investment to GDP
ea_im = real imports
ea_imr = bilateral imports from R
ea_infc = CPI inflation
ea_inflation = GDP price inflation including trend
ea_infx = export price inflation
ea_infy = GDP price inflation 
ea_inom = nom risk-free interest rate
ea_k = private capital stock 
ea_kg = public capital stock 
ea_l = employment
ea_lamlc = Lagrangian LC
ea_lamnlc = Lagrangian NLC
ea_ltfp = log TFP
ea_m = money 
ea_nomint = nom interest rate including trend growth 
ea_o = total output
ea_oil = oil
EA_pbl = price bl
ea_pc = CPI
ea_pcy = core CPI (excl oil)
ea_pim = import price deflator
ea_po = output price deflator
ea_poil = oil price
ea_px = export price deflator
ea_py = GDP deflator
ea_q = Tobin's Q
ea_r = real interest rate
ea_realint = real interest rate including trend growth 
ea_tax = lump-sum tax
ea_tby = trade balance to GDP
ea_tfp = TFP
ea_tl = labour tax
ea_tot = terms of trade
ea_toty = non-oil terms of trade
ea_tr = gov transfers
ea_trlc = gov transfers to LC
ea_ucap = capacity utilisation
ea_ucnlc = consumption utility NLC
ea_v = firm value
ea_vl = marginal disutility of labour
ea_winf = wage inflation
ea_wr = real wage
ea_wrinf = real wage inflation
ea_y = real GDP including adjustment costs 
ea_ygap = output gap
EA_yobs = real GDP as sum of components (C+I+G+IG+NX)
*/

//List of exogenous variables (EA = EA, equivalent for R_ = RoW)

/*
ea_a = steady state TFP
ea_btar = gov debt target
ea_bwyt = NFA target
ea_eps_ben = shock to ben
ea_eps_clc = shock to clc
ea_eps_cnlc = shock to cnlc (savings)
ea_eps_eta = mark-up shock
ea_eps_etax = shock to tax
ea_eps_g = shock to g
ea_eps_i = shock to capital stock adjustment costs 
ea_eps_ig = shock to ig
ea_eps_im = shock to import demand
ea_eps_l = shock to labour supply
ea_eps_ltfp = shock to ltfp
ea_eps_m  = monetary policy shock
EA_eps_qe = exogenous central bank stock of long-term bonds
ea_eps_rpremb = shock to gov debt risk premium
ea_eps_rpreme = shock to currency risk premium
ea_eps_rpremk = shock to investment risk premium
ea_eps_tl = shock to fiscal closure rule
ea_eps_tr = shock to tr
ea_eps_trlc = shock to trlc
ea_eps_ucap = shock to ucap
ea_eps_v = shock to firm value
ea_eps_w = labour demand shock
ea_ex_ben = steady state ben
ea_ex_by = steady state by
ea_ex_gby = steady state gby
ea_ex_gs = steady state gs
ea_ex_igs = steady state igs
ea_ex_inf = steady state inflation
ea_ex_ltfp = steady state ltfp
ea_ex_tl = steady state tl
ea_ex_trlc = steady state trlc
ea_ex_tvat = steady state tvat
ea_fcl = overhead labour
ea_fcy = fix costs of production
ea_g = gov consumption
ea_ig = gov investment
ea_ilag = persistence in Taylor rule
ea_im1lag = persistence in bilateral imports
EA_inoml = coupon payment on long-term bonds
ea_libdum = dummy UIP condition
ea_npart = non-participation rate
EA_profcb = central bank profit
ea_rpremb = endogenous gov bond risk premium
ea_rpremk = steady state equity premium
ea_size = country size
ea_slc = share LC households
ea_ssc = employer social security contributions
ea_taxdum = dummy fiscal closure rule
ea_taxshare = lump-sum tax revenue to GDP
ea_tc = corporate tax
ea_tinf = Taylor rule inflation coefficient
ea_trshare = steady state transfer level
ea_tryshare = steady state transfers to GDP
ea_tvat = VAT rate
ea_ty = Taylor rule output coefficient
ea_upi = investment specific price shock
w_coreinf = core inflation
w_gpop = trend population growth
w_gtfp = trend TFP growth
*/

//List of parameters (EA = EA, equivalent for R_ = RoW)

/*
dyn = dynamics dummy
ea_a1 = ucap adjustment costs
ea_a2 = ucap adjustment costs
ea_alpha = labour share in production function
ea_alphag = public capital in production function
ea_benex = benefit indexation dummy
ea_benpc = benefit indexation to CPI
ea_benrr = ben replacement rate
ea_bentl = benefit indexation to tl
ea_bentvat = benefit indexation to tvat
ea_delta = private capital stock depreciation rate
EA_deltabl = long-term bond depreciation rate
ea_deltag = public capital stock depreciation rate
ea_dumtrlc = dummy trlc indexation
EA_gamb = bond portfolio (bl vs bl) adjustment costs  
EA_gambd = bond portfolio (bl domestic vs bl foreign) adjustment costs
ea_gami = capital stock adjustment costs
ea_gami2 = investment stock adjustment costs
ea_gamim = import adjustment friction
ea_gaml = labour adjustment costs
ea_gamoil = oil adjustment costs 
ea_gamp = price adjustment costs
ea_gampx = export price adjustment costs
ea_gamw = wage adjustment costs
EA_gamxr = indexation of foreign bl value to nom exchange rate
ea_gslag = persistence gs
ea_hab = consumption habits
ea_habl = labour supply habits
ea_igslag = persistence igs
ea_kappa = inverse labour supply elasticity
EA_kbl = steady state portfolio share bl
EA_kblf = steady state portfolio share blf
ea_llag = persistence in employment trend
ea_omeg = weight of leisure in utility function 
ea_pimlag = persistence in pim
ea_rho = parameter finite planning horizon 
EA_rhoqe = persistence QE bond purchases
ea_rhotfp = persistence TFP
ea_rlag = perssistence trend real interest rate
ea_rprem = endogenous currency risk premium
ea_s = steady state home bias in demand
EA_sbl = steady state share bl in b
ea_sfim = forward-looking import expectations
ea_sfp = forward-looking price expectations
ea_sfpx = forward-looking export price expectations
ea_sfw = forward-looking wage expectations
ea_sig = price elaticity of import demand
ea_sig1 = price elaticity of bilateral import demand
ea_sigc = intertemporal elasticity of substitution
ea_sigmaoil = price elasticity of oil demand
ea_soil = steady state demand share of oil
ea_sxd = indexation of import prices to GDP deflator
ea_s_r = steady state bilateral import share
ea_tau = steady state price mark-up 
ea_taux = steady state export price mark-up 
ea_tgovb1 = coefficient on by in fiscal closure rule 
ea_tgovb2 = coefficient on db in fiscal closure rule 
ea_tgovby = coefficient on gby in fiscal closure rule 
ea_tgovinf = coefficient on infc in fiscal closure rule 
ea_theta = discount factor
ea_thetanlc = elasticity of substitution between varieties of labour
EA_tqe = endogenous response of QE
ea_trnom = dummy gov transfer indexation
ea_ucaplag = persistence in trend ucap
ea_zet = elasticity money demand
lev = dummy dynamics notation
*/

var ea_b ea_ben EA_bl EA_blcb EA_blnlc EA_blnlcd EA_blnlcf ea_br EA_bs ea_bw ea_bwr ea_by ea_c ea_cay ea_clc ea_cnlc ea_db EA_dbl EA_dblcb EA_dblnlcf ea_dbr EA_dbs ea_dbwr ea_dc ea_dcnlc ea_de ea_dex ea_dexl ea_dexr ea_dexucap ea_dgs ea_di ea_digs ea_dim ea_dinfc ea_dinfx ea_dinfy ea_dinom ea_dk ea_dkg ea_dl ea_dlamlc ea_dlamnlc ea_dltfp EA_dm ea_dnomint ea_doil EA_dpbl ea_dpim ea_dpx ea_dpy ea_dq ea_dr ea_drealint ea_dtl ea_dv ea_dwinf ea_dwr ea_dy ea_e ea_eps_gs ea_eps_igs ea_eta ea_ex ea_ex_l ea_ex_r ea_ex_ucap ea_f ea_gby ea_gs ea_i ea_igs ea_im ea_imr ea_infc ea_inflation ea_infx ea_infy ea_inom ea_k ea_kg ea_l ea_lamlc ea_lamnlc ea_ltfp ea_m ea_nomint ea_o ea_oil EA_pbl ea_pc ea_pcy ea_pim ea_po ea_poil ea_px ea_py ea_q ea_r ea_realint ea_tax ea_tby ea_tfp ea_tl ea_tot ea_toty ea_tr ea_trlc ea_ucap ea_ucnlc ea_v ea_vl ea_winf ea_wr ea_wrinf ea_y ea_ygap EA_yobs r_b r_ben R_bl R_blcb R_blnlc R_blnlcd R_blnlcf r_br R_bs r_bw r_bwr r_by r_c r_cay r_clc r_cnlc r_db R_dbl R_dblcb R_dblnlcf r_dbr R_dbs r_dbwr r_dc r_dcnlc r_dex r_dexl r_dexr r_dexucap r_dgs r_di r_digs r_dim r_dinfc r_dinfx r_dinfy r_dinom r_dk r_dkg r_dl r_dlamlc r_dlamnlc r_dltfp R_dm r_dnomint r_doil R_dpbl r_dpim r_dpx r_dpy r_dq r_dr r_drealint r_dtl r_dv r_dwinf r_dwr r_dy r_eps_gs r_eps_igs r_eta r_ex r_ex_l r_ex_r r_ex_ucap r_exoil r_f r_gby r_gs r_i r_igs r_im r_imea r_infc r_inflation r_infx r_infy r_inom r_k r_kg r_l r_lamlc r_lamnlc r_ltfp r_m r_nomint r_o r_oil R_pbl r_pc r_pcy r_pim r_po r_poil R_profcb r_px r_py r_q r_r r_realint r_tax r_tby r_tfp r_tl r_tot r_toty r_tr r_trlc r_ucap r_ucnlc r_v r_vl r_winf r_wr r_wrinf r_y r_ygap R_yobs
    ea_g
 //**************************************************************************
// Modelbase Variables                                                   //*
    interest inflation inflationq outputgap output fispol;               //*
//**************************************************************************    

varexo ea_a ea_btar ea_bwyt ea_eps_ben ea_eps_clc ea_eps_cnlc ea_eps_eta ea_eps_etax ea_eps_g ea_eps_i ea_eps_ig ea_eps_im ea_eps_l ea_eps_ltfp EA_eps_qe ea_eps_rpremb ea_eps_rpreme ea_eps_rpremk ea_eps_tl ea_eps_tr ea_eps_trlc ea_eps_ucap ea_eps_v ea_eps_w ea_ex_ben ea_ex_by ea_ex_gby ea_ex_gs ea_ex_igs ea_ex_inf ea_ex_ltfp ea_ex_tl ea_ex_trlc ea_ex_tvat ea_fcl ea_fcy ea_ig ea_im1lag EA_inoml ea_libdum ea_npart EA_profcb ea_rpremb ea_rpremk ea_size ea_slc ea_ssc ea_taxdum ea_taxshare ea_tc ea_trshare ea_tryshare ea_tvat ea_upi null r_a r_btar r_e r_eps_ben r_eps_clc r_eps_cnlc r_eps_eta r_eps_etax r_eps_g r_eps_i r_eps_ig r_eps_im r_eps_l r_eps_ltfp r_eps_m r_eps_poil R_eps_qe r_eps_rpremb r_eps_rpremk r_eps_tl r_eps_tr r_eps_trlc r_eps_ucap r_eps_v r_eps_w r_ex_ben r_ex_by r_ex_gby r_ex_gs r_ex_igs r_ex_inf r_ex_ltfp r_ex_tl r_ex_trlc r_ex_tvat r_fcl r_fcy r_g r_ig r_ilag r_im1lag R_inoml r_npart r_rpremb r_rpremk r_size r_slc r_ssc r_taxdum r_taxshare r_tc r_tinf r_trshare r_tryshare r_tvat r_ty r_upi w_coreinf w_gpop w_gtfp
//**************************************************************************
// Modelbase Shocks                                                      //*       
    interest_ fiscal_  ;                                                 //*
//**************************************************************************
 
parameters 
//************************************************************************** 
// Modelbase Parameters                                                  //*
                                                                         //*
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4              //*
        std_r_ std_r_quart coffispol                                     //*          
//**************************************************************************

dyn ea_a1 ea_a2 ea_alpha ea_alphag ea_benex ea_benpc ea_benrr ea_bentl ea_bentvat ea_delta EA_deltabl ea_deltag ea_dumtrlc EA_gamb EA_gambd ea_gami ea_gami2 ea_gamim ea_gaml ea_gamoil ea_gamp ea_gampx ea_gamw EA_gamxr ea_gslag ea_hab ea_habl ea_igslag ea_kappa EA_kbl EA_kblf ea_llag ea_omeg ea_pimlag ea_rho EA_rhoqe ea_rhotfp ea_rlag ea_rprem ea_s EA_sbl ea_sfim ea_sfp ea_sfpx ea_sfw ea_sig ea_sig1 ea_sigc ea_sigmaoil ea_soil ea_sxd ea_s_r ea_tau ea_taux ea_tgovb1 ea_tgovb2 ea_tgovby ea_tgovinf ea_theta ea_thetanlc EA_tqe ea_trnom ea_ucaplag ea_zet lev r_a1 r_a2 r_alpha r_alphag r_benex r_benpc r_benrr r_bentl r_bentvat r_delta R_deltabl r_deltag r_dumtrlc R_gamb R_gambd r_gami r_gami2 r_gamim r_gaml r_gamoil r_gamp r_gampx r_gamw R_gamxr r_gslag r_hab r_habl r_igslag r_kappa R_kbl R_kblf r_llag r_omeg r_pimlag r_poildol r_rho R_rhoqe r_rhotfp r_rlag r_s R_sbl r_sfim r_sfp r_sfpx r_sfw r_sig r_sig1 r_sigc r_sigmaoil r_soil r_sxd r_s_ea r_tau r_taux r_tgovb1 r_tgovb2 r_tgovby r_tgovinf r_theta r_thetanlc R_tqe r_trnom r_ucaplag r_zet;

//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
    deep_parameter_name = M_.param_names(i,:);                           
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath);
std_r_ = 1;                                                            //* 
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                       //*
//**************************************************************************

dyn=1;
ea_a1=0.0323611111111111;
ea_a2=0.05;
ea_alpha=0.65;
ea_alphag=0.9121815166591;
ea_benex=0;
ea_benpc=0;
ea_benrr=0.4;
ea_bentl=0;
ea_bentvat=1;
ea_delta=0.015;
EA_deltabl=0.975;
ea_deltag=0.0125;
ea_dumtrlc=1;
EA_gamb=0.00014454;
EA_gambd=0.00014454*9;
ea_gami=20;
ea_gami2=75;
ea_gamim=0.9;
ea_gaml=25;
ea_gamoil=200;
ea_gamp=19.745368045331;
ea_gampx=15;
ea_gamw=596.457851250621;
EA_gamxr=0;
ea_gslag=0;
ea_hab=0.7;
ea_habl=0;
ea_igslag=0;
ea_kappa=-5;
EA_kbl=1;
EA_kblf=1.5;
ea_llag=0.95;
ea_omeg=0.0011834753192537;
ea_pimlag=0.9;
ea_rho=0;
EA_rhoqe=0;
ea_rhotfp=0.95;
ea_rlag=0.99;
ea_rprem=0.0001;
ea_s=0.77262755183341;
EA_sbl=0.5;
ea_sfim=0.1;
ea_sfp=0.9;
ea_sfpx=0.8;
ea_sfw=0.9;
ea_sig=1.1;
ea_sig1=0.5;
ea_sigc=1;
ea_sigmaoil=0.05;
ea_soil=0;
ea_sxd=1;
ea_s_r=1;
ea_tau=0.25;
ea_taux=0;
ea_tgovb1=0.01;
ea_tgovb2=0.1;
ea_tgovby=0;
ea_tgovinf=0;
ea_theta=0.00323437285093475;
ea_thetanlc=6.5;
EA_tqe=0;
ea_trnom=1;
ea_ucaplag=0.99;
ea_zet=0.4;
lev=0;
r_a1=0.0323611111111107;
r_a2=0.05;
r_alpha=0.650000000000003;
r_alphag=0.9121815166591;
r_benex=0;
r_benpc=0;
r_benrr=0.4;
r_bentl=0;
r_bentvat=1;
r_delta=0.015;
R_deltabl=0.975;
r_deltag=0.0125;
r_dumtrlc=1;
R_gamb=0.00014454;
R_gambd=0.00014454*9;
r_gami=20;
r_gami2=75;
r_gamim=0.9;
r_gaml=25;
r_gamoil=200;
r_gamp=19.745368045331;
r_gampx=15;
r_gamw=596.457851250621;
R_gamxr=0;
r_gslag=0;
r_hab=0.7;
r_habl=0;
r_igslag=0;
r_kappa=-5;
R_kbl=1;
R_kblf=0.138227023763018;
r_llag=0.95;
r_omeg=0.00118345148252291;
r_pimlag=0.9;
r_poildol=1;
r_rho=0;
R_rhoqe=0;
r_rhotfp=0.95;
r_rlag=0.99;
r_s=0.953979572118702;
R_sbl=0.5;
r_sfim=0.1;
r_sfp=0.9;
r_sfpx=0.8;
r_sfw=0.9;
r_sig=1.1;
r_sig1=0.5;
r_sigc=1;
r_sigmaoil=0.05;
r_soil=0;
r_sxd=1;
r_s_ea=1;
r_tau=0.250000000000001;
r_taux=0;
r_tgovb1=0.01;
r_tgovb2=0.1;
r_tgovby=0;
r_tgovinf=0;
r_theta=0.00323437285093475;
r_thetanlc=6.5;
R_tqe=0;
r_trnom=1;
r_ucaplag=0.99;
r_zet=0.4;
 
model; 
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*(ea_inom-r_inom);                //* //or just = 100*ea_inom*4
inflation = (1/4)*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));      //*
inflationq = 4*(ea_infc-r_infc);          //* // or just = 100*4*ea_infc
output = 1*ln(ea_y);
outputgap=1*ea_ygap;

 //**************************************************************************

%          ea_inom = ea_ilag*(ea_inom-ea_dinom)+(1-ea_ilag)*(ea_ex_r+ea_ex_inf+ea_tinf*(ea_infc-ea_ex_inf)+ea_ty*ea_ygap)+ea_eps_m;
//**************************************************************************                                                                    
// Policy Rule                                                           //*
                                                                         //*
// Monetary Policy                                                       //*
                                                                         //*
interest = cofintintb1*interest(-1)                                      //*  
           + cofintintb2*interest(-2)                                    //* 
           + cofintintb3*interest(-3)                                    //*  
           + cofintintb4*interest(-4)                                    //* 
           + cofintinf0*inflationq                                       //* 
           + cofintinfb1*inflationq(-1)                                  //* 
           + cofintinfb2*inflationq(-2)                                  //* 
           + cofintinfb3*inflationq(-3)                                  //* 
           + cofintinfb4*inflationq(-4)                                  //* 
           + cofintinff1*inflationq(+1)                                  //* 	      
           + cofintinff2*inflationq(+2)                                  //* 
           + cofintinff3*inflationq(+3)                                  //* 
           + cofintinff4*inflationq(+4)                                  //* 
           + cofintout*outputgap                                         //* 
           + cofintoutb1*outputgap(-1)                                   //* 
           + cofintoutb2*outputgap(-2)                                   //* 
           + cofintoutb3*outputgap(-3)                                   //* 
           + cofintoutb4*outputgap(-4)                                   //* 
           + cofintoutf1*outputgap(+1)                                   //* 
           + cofintoutf2*outputgap(+2)                                   //* 
           + cofintoutf3*outputgap(+3)                                   //* 
           + cofintoutf4*outputgap(+4)                                   //* 
           + std_r_ * interest_;                                         //*
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
fispol = coffispol*fiscal_;                                              //*
fispol = ea_g-0.18;
//**************************************************************************

          1/(1+ea_theta+ea_rho)*(lev*ea_lamnlc(1)+(1-lev)*(ea_lamnlc+ea_dlamnlc(1)))/ea_lamnlc = 1/(1+ea_inom)*(1+ea_infy(1))+EA_gamb*EA_pbl*EA_kbl*(EA_kbl*EA_bs/EA_blnlc-1)*(1+ea_infy(1)) ;
          ea_f = ea_b/ea_py+ea_e*ea_bw/ea_py+ea_v*(1+ea_eps_v) ;
          ea_lamnlc = ea_ucnlc/((1+ea_tvat)*ea_pc/ea_py) ;
          ea_ucnlc = exp(ea_eps_cnlc)*(1-ea_hab)^ea_sigc*(ea_cnlc-ea_hab*(ea_cnlc-ea_dcnlc))^(-ea_sigc) ;
          ea_clc = (1-ea_tl)*ea_wr*ea_py/(ea_pc*(1+ea_tvat))*ea_l+ea_ben/(ea_pc*(1+ea_tvat))*(1-ea_npart-ea_l)+ea_trlc/(ea_pc*(1+ea_tvat))-ea_tax/(ea_pc*(1+ea_tvat))+ea_eps_clc ;
          ea_lamlc = (1-ea_hab)^ea_sigc*(ea_clc-ea_hab*ea_clc(-1))^(-ea_sigc)/((1+ea_tvat)*ea_pc/ea_py) ;
          ea_c = (1-ea_slc)*ea_cnlc+ea_slc*ea_clc ;
          ea_vl = exp(ea_eps_l)*ea_omeg*(1-ea_l-ea_habl*ea_l+ea_habl*(ea_l-ea_dl))^ea_kappa ;
          ea_vl = ((1-ea_slc)*ea_lamnlc+ea_slc*ea_lamlc)*((1-ea_thetanlc)/(-ea_thetanlc)*(ea_wr*(1-ea_tl)-ea_ben/ea_py)-1/ea_thetanlc*(1-ea_npart)/ea_l*ea_ben/ea_py+ea_gamw/ea_thetanlc*ea_wr*ea_winf)-(lev*((1-ea_slc)*ea_lamnlc(1)+ea_slc*ea_lamlc(1))+(1-lev)*((1-ea_slc)*(ea_lamnlc+ea_dlamnlc(1))+ea_slc*(ea_lamlc+ea_dlamlc(1))))*1/(1+ea_theta+ea_rho)*ea_gamw/ea_thetanlc*ea_wr/(1+ea_infy+ea_dinfy(1))*(ea_l+ea_dl(1))/ea_l*(ea_sfw*(lev*ea_winf(1)+(1-lev)*(ea_winf+ea_dwinf(1)))+(1-ea_sfw)*(ea_winf-ea_dwinf)) ;
          ea_ben = ea_benex*ea_ex_ben*ea_pc*((1+ea_tvat)/(1+ea_ex_tvat))^ea_bentvat/ea_py+(1-ea_benex)*ea_benrr*ea_wr*((1-ea_tl)/(1-ea_ex_tl))^ea_bentl*ea_py*(ea_pc*((1+ea_tvat)/(1+ea_ex_tvat))^ea_bentvat/ea_py)^ea_benpc+ea_eps_ben ;
          ea_tr = ea_trnom*ea_trshare*ea_y*ea_py+(1-ea_trnom)*ea_tryshare*ea_py+ea_eps_tr ;
          ea_trlc = ea_dumtrlc*ea_tr+(1-ea_dumtrlc)*ea_ex_trlc+ea_eps_trlc ;
          ea_g = ea_gs*ea_y*ea_py/ea_pc+ea_eps_gs ;
          ea_gs = (1-ea_gslag)*ea_ex_gs+ea_gslag*(ea_gs-ea_dgs)+ea_eps_g ;
          ea_ig = ea_igs*ea_y*ea_py/ea_pc+ea_eps_igs ;
          ea_igs = (1-ea_igslag)*ea_ex_igs+ea_igslag*(ea_igs-ea_digs)+ea_eps_ig ;
          (ea_gami+ea_eps_i)*(ea_i/(ea_k-ea_dk)-(ea_delta+w_gtfp+w_gpop))+ea_gami2*ea_di-ea_gami2*1/(1+ea_theta+ea_rho)*(lev*ea_lamnlc(1)+(1-lev)*(ea_lamnlc+ea_dlamnlc(1)))/ea_lamnlc*(1+ea_infc+ea_dinfc(1))/(1+ea_infy+ea_dinfy(1))*(lev*(ea_i(1)-ea_i)+(1-lev)*ea_di(1)) = ea_q-1 ;
          ea_eta*ea_py/(ea_pc*(1+ea_upi))*(1-ea_tc)*(1-ea_alpha)*(ea_y+ea_fcy*ea_tfp)/ea_k+ea_tc*ea_delta = ea_q-(1-ea_delta)/(1+ea_theta+ea_rho)/(1+ea_rpremk+ea_eps_rpremk)*(lev*ea_lamnlc(1)+(1-lev)*(ea_lamnlc+ea_dlamnlc(1)))/ea_lamnlc*(lev*ea_q(1)+(1-lev)*(ea_q+ea_dq(1)))+dyn*(ea_a1*(ea_ucap-1)+ea_a2*(ea_ucap-1)^2) ;
          ea_wr*(1+ea_ssc) = (ea_eta*ea_alpha*(ea_y+ea_fcy*ea_tfp)/(ea_l-ea_fcl)-ea_gaml*ea_wr*ea_dl+ea_gaml*(lev*ea_wr(1)+(1-lev)*(ea_wr+ea_dwr(1)))/(1+ea_theta+ea_rho)*(lev*ea_lamnlc(1)+(1-lev)*(ea_lamnlc+ea_dlamnlc(1)))/ea_lamnlc*(lev*(ea_l(1)-ea_l)+(1-lev)*ea_dl(1)))/(1+ea_eps_w) ;
          ea_k = ea_i+(1-(ea_delta+w_gtfp+w_gpop))*(ea_k-ea_dk) ;
          ea_eta*(1-ea_alpha)*(ea_y+ea_fcy*ea_tfp)/ea_k = ea_pc/ea_py*(ea_a1+2*ea_a2*(ea_ucap-1)+ea_eps_ucap)*ea_ucap ;
          ea_eta = 1-(ea_tau+ea_eps_eta)-ea_gamp*(1/(1+ea_theta+ea_rho)*ea_sfp*(lev*ea_infy(1)+(1-lev)*(ea_infy+ea_dinfy(1)))+(1-ea_sfp)*(ea_infy-ea_dinfy)-ea_infy) ;
          ea_y = (ea_s-ea_eps_im)*(ea_pcy/ea_py)^ea_sig*(1-ea_soil)*(ea_pc/ea_pcy)^ea_sigmaoil*(ea_c+ea_i*(1+ea_upi)^ea_sigmaoil+ea_g+ea_ig)+ea_ex+(ea_gami+ea_eps_i)/2*(ea_i/(ea_k-ea_dk)-(ea_delta+w_gtfp+w_gpop))^2*(ea_k-ea_dk)+ea_gami2/2*ea_di^2+ea_gamp/2*ea_infy^2*ea_y+ea_gamw/2*ea_winf^2*ea_l+ea_gaml/2*ea_dl^2*ea_wr+EA_gamb/2*(EA_kbl*EA_bs/EA_blnlc-1)^2+EA_gambd/2*(EA_kblf*EA_blnlcd/(ea_e^EA_gamxr*r_size/ea_size*EA_blnlcf)-1)^2 ;
          ea_kg = ea_ig+(1-(ea_deltag+w_gtfp+w_gpop))*(ea_kg-ea_dkg) ;
          ea_y = ea_a*(ea_ucap*ea_k)^(1-ea_alpha)*((ea_l-ea_fcl)*ea_tfp)^ea_alpha*ea_kg^(1-ea_alphag)-ea_fcy*ea_tfp ;
          ea_tfp = exp(ea_ltfp) ;
          ea_ltfp = (1-ea_rhotfp)*ea_ex_ltfp+ea_rhotfp*(ea_ltfp-ea_dltfp)+ea_eps_ltfp ;
          ea_o = 1/ea_po*(ea_py*ea_y+ea_poil*ea_oil) ;
          ea_oil = ea_soil*(ea_c+ea_i+ea_g+ea_ig)*(ea_poil/ea_pc)^(-ea_sigmaoil)-ea_gamoil*ea_doil+ea_gamoil*(lev*(ea_oil(1)-ea_oil)+(1-lev)*ea_doil(1)) ;
          ea_ygap = (1-ea_alpha)*log(ea_ucap/ea_ex_ucap)+ea_alpha*log(ea_l/ea_ex_l) ;
          ea_ex_l = ea_llag*(ea_ex_l-ea_dexl)+(1-ea_llag)*ea_l ;
          ea_ex_ucap = ea_ucaplag*(ea_ex_ucap-ea_dexucap)+(1-ea_ucaplag)*ea_ucap ;
          ea_ex_r = ea_rlag*(ea_ex_r-ea_dexr)+(1-ea_rlag)*ea_r ;
%          ea_inom = ea_ilag*(ea_inom-ea_dinom)+(1-ea_ilag)*(ea_ex_r+ea_ex_inf+ea_tinf*(ea_infc-ea_ex_inf)+ea_ty*ea_ygap)+ea_eps_m ;
          ea_pc = ((1-ea_soil)*ea_pcy^(1-ea_sigmaoil)+ea_soil*ea_poil^(1-ea_sigmaoil))^(1/(1-ea_sigmaoil)) ;
          ea_pcy = (ea_s*ea_py^(1-ea_sig)+(1-ea_s)*ea_pim^(1-ea_sig))^(1/(1-ea_sig)) ;
          ea_infy = ea_dpy/(ea_py-ea_dpy) ;
          ea_po = ea_py*ea_py*ea_y/(ea_py*ea_y+ea_poil*ea_oil)+ea_poil*ea_poil*ea_oil/(ea_py*ea_y+ea_poil*ea_oil) ;
          ea_wrinf = ea_dwr/(ea_wr-ea_dwr) ;
          ea_winf = ea_wrinf+ea_infy ;
          ea_r = ea_inom-(lev*ea_infy(1)+(1-lev)*(ea_infy+ea_dinfy(1))) ;
          ea_b = ea_br*ea_py ;
          EA_bs/ea_py/(1+ea_inom+ea_rpremb*(ea_b/(4*ea_y*ea_py)-ea_ex_by)+ea_eps_rpremb) = (EA_bs-EA_dbs)/(ea_py-ea_dpy)/(1+ea_infy)+ea_pc/ea_py*ea_g+ea_pc/ea_py*ea_ig+(1-ea_slc)*ea_tr/ea_py+ea_slc*ea_trlc/ea_py+ea_ben/ea_py*(1-ea_npart-ea_l)-ea_tl*ea_wr*ea_l-ea_ssc*ea_wr*ea_l-ea_tvat*ea_pc/ea_py*ea_c-(ea_tc*(ea_y-(1+ea_ssc)*ea_wr*ea_l)-ea_tc*ea_delta*ea_k*ea_pc/ea_py)-ea_tax/ea_py-EA_profcb/ea_py+(EA_bl-EA_dbl)/(ea_py-ea_dpy)/(1+ea_infy)*(EA_deltabl*EA_pbl+EA_inoml)-EA_bl/ea_py*EA_pbl ;
          ea_gby = -(ea_b-(ea_b-ea_db)/((1+w_gtfp)*(1+w_gpop)*(1+w_coreinf)))/(4*ea_py*ea_y) ;
          ea_by = ea_b/4/ea_py/ea_y ;
          ea_tax = ea_taxshare*ea_y*ea_py ;
          ea_tl = ea_tl-ea_dtl+ea_taxdum*(ea_tgovb1*(ea_b/(4*ea_y*ea_py)-ea_btar)+ea_tgovb2*ea_dbr+ea_tgovby*(ea_gby-ea_ex_gby)+ea_tgovinf*(ea_infc-ea_ex_inf))+ea_eps_tl ;
          ea_im = (1-ea_s+ea_eps_im)*(ea_pim/ea_pc)^(-ea_sig)*(1-ea_soil)*(ea_c+ea_i+ea_g+ea_ig)*(((lev*ea_im(1)+(1-lev)*(ea_im+ea_dim(1)))/ea_im)^ea_sfim/(ea_im/(ea_im-ea_dim))^(1-ea_sfim))^ea_gamim ;
          ea_tby = (ea_px/ea_py*ea_ex-ea_pim/ea_py*ea_im-ea_poil/ea_py*ea_oil)*100/ea_y ;
          ea_e*ea_bwr+ea_e*R_pbl*r_size/ea_size*EA_blnlcf-EA_pbl*R_blnlcf = (1+r_inom-r_dinom-ea_infy)*ea_e*(ea_bwr-ea_dbwr)+ea_e*(R_inoml+R_deltabl*R_pbl)*r_size/ea_size*(EA_blnlcf-EA_dblnlcf)-(EA_inoml+EA_deltabl*EA_pbl)*(R_blnlcf-R_dblnlcf)+ea_px/ea_py*ea_ex-ea_pim/ea_py*ea_im-ea_poil/ea_py*ea_oil ;
          ea_bw = ea_bwr*ea_py ;
          ea_lamnlc*(1+ea_theta+ea_rho)/(lev*ea_lamnlc(1)+(1-lev)*(ea_lamnlc+ea_dlamnlc(1)))*(1+ea_infy(1))-1 = r_inom+(lev*(ea_e(1)-ea_e)+(1-lev)*ea_de(1))/ea_e-ea_rprem*ea_libdum*(ea_bw/(4*ea_y*ea_py)-ea_bwyt)+ea_eps_rpreme ;
          ea_px = 1/(1-ea_taux-ea_eps_etax-ea_gampx*(1/(1+ea_theta+ea_rho)*(ea_sfpx*(lev*ea_infx(1)+(1-lev)*(ea_infx+ea_dinfx(1)))+(1-ea_sfpx)*(ea_infx-ea_dinfx))-ea_infx))*ea_py^ea_sxd*ea_pc^(1-ea_sxd) ;
          ea_infx = ea_dpx/(ea_px-ea_dpx) ;
          ea_v = (1-ea_tc)*(ea_y-(1+ea_ssc)*ea_wr*ea_l)+ea_tc*ea_delta*ea_k*ea_pc/ea_py-ea_pc/ea_py*ea_i+1/(1+ea_theta+ea_rho)/(1+ea_rpremk+ea_eps_rpremk)*(lev*ea_lamnlc(1)+(1-lev)*(ea_lamnlc+ea_dlamnlc(1)))/ea_lamnlc*(lev*ea_v(1)+(1-lev)*(ea_v+ea_dv(1))) ;
          ea_poil = ea_e/r_e*r_poil ;
          ea_tot = ea_px/((1-ea_soil)*ea_pim+ea_soil*ea_poil) ;
          ea_toty = ea_px/ea_pim ;
          ea_nomint = (1+ea_inom)*(1+w_gpop)*(1+w_gtfp)*(1+w_coreinf)-1 ;
          ea_realint = (1+ea_r)*(1+w_gpop)*(1+w_gtfp)-1 ;
          ea_inflation = (1+ea_infy)*(1+w_coreinf)-1 ;
          ea_cay = ea_e*(ea_bwr-1/((1+w_gtfp)*(1+w_gpop))*(ea_bwr-ea_dbwr))/ea_y*100 ;
          ea_dbwr = dyn*(ea_bwr-ea_bwr(-1))+(1-dyn)*null ;
          ea_de = dyn*(ea_e-ea_e(-1))+(1-dyn)*null ;
          ea_dpx = dyn*(ea_px-ea_px(-1))+(1-dyn)*null ;
          ea_dex = dyn*(ea_ex-ea_ex(-1))+(1-dyn)*null ;
          ea_dpim = dyn*(ea_pim-ea_pim(-1))+(1-dyn)*null ;
          ea_dim = dyn*(ea_im-ea_im(-1))+(1-dyn)*null ;
          ea_dq = dyn*(ea_q-ea_q(-1))+(1-dyn)*null ;
          ea_dlamnlc = dyn*(ea_lamnlc-ea_lamnlc(-1))+(1-dyn)*null ;
          ea_dlamlc = dyn*(ea_lamlc-ea_lamlc(-1))+(1-dyn)*null ;
          ea_dk = dyn*(ea_k-ea_k(-1))+(1-dyn)*null ;
          ea_dkg = dyn*(ea_kg-ea_kg(-1))+(1-dyn)*null ;
          ea_dl = dyn*(ea_l-ea_l(-1))+(1-dyn)*null ;
          ea_di = dyn*(ea_i-ea_i(-1))+(1-dyn)*null ;
          ea_dcnlc = dyn*(ea_cnlc-ea_cnlc(-1))+(1-dyn)*null ;
          ea_infc = dyn*(ea_pc/ea_pc(-1)-1)+(1-dyn)*null ;
          ea_dinfc = dyn*(ea_infc-ea_infc(-1))+(1-dyn)*null ;
          ea_dinfy = dyn*(ea_infy-ea_infy(-1))+(1-dyn)*null ;
          ea_dinfx = dyn*(ea_infx-ea_infx(-1))+(1-dyn)*null ;
          ea_dwr = dyn*(ea_wr-ea_wr(-1))+(1-dyn)*null ;
          ea_dwinf = dyn*(ea_winf-ea_winf(-1))+(1-dyn)*null ;
          ea_dltfp = dyn*(ea_ltfp-ea_ltfp(-1))+(1-dyn)*null ;
          ea_dgs = dyn*(ea_gs-ea_gs(-1))+(1-dyn)*null ;
          ea_digs = dyn*(ea_igs-ea_igs(-1))+(1-dyn)*null ;
          ea_db = dyn*(ea_b-ea_b(-1))+(1-dyn)*null ;
          ea_dbr = dyn*(ea_br-ea_br(-1))+(1-dyn)*null ;
          ea_dtl = dyn*(ea_tl-ea_tl(-1))+(1-dyn)*null ;
          ea_dv = dyn*(ea_v-ea_v(-1))+(1-dyn)*null ;
          ea_dc = dyn*(ea_c-ea_c(-1))+(1-dyn)*null ;
          ea_dexr = dyn*(ea_ex_r-ea_ex_r(-1))+(1-dyn)*null ;
          ea_dr = dyn*(ea_r-ea_r(-1))+(1-dyn)*null ;
          ea_drealint = dyn*(ea_realint-ea_realint(-1))+(1-dyn)*null ;
          ea_dexl = dyn*(ea_ex_l-ea_ex_l(-1))+(1-dyn)*null ;
          ea_dexucap = dyn*(ea_ex_ucap-ea_ex_ucap(-1))+(1-dyn)*null ;
          ea_dpy = dyn*(ea_py-ea_py(-1))+(1-dyn)*null ;
          ea_dy = dyn*(ea_y-ea_y(-1))+(1-dyn)*null ;
          ea_dinom = dyn*(ea_inom-ea_inom(-1))+(1-dyn)*null ;
          ea_dnomint = dyn*(ea_nomint-ea_nomint(-1))+(1-dyn)*null ;
          ea_doil = dyn*(ea_oil-ea_oil(-1))+(1-dyn)*null ;
          1/(1+r_theta+r_rho)*(lev*r_lamnlc(1)+(1-lev)*(r_lamnlc+r_dlamnlc(1)))/r_lamnlc = 1/(1+r_inom)*(1+r_infy(1))+R_gamb*R_pbl*R_kbl*(R_kbl*R_bs/R_blnlc-1)*(1+r_infy(1)) ;
          r_f = r_b/r_py+r_e*r_bw/r_py+r_v*(1+r_eps_v) ;
          r_lamnlc = r_ucnlc/((1+r_tvat)*r_pc/r_py) ;
          r_ucnlc = exp(r_eps_cnlc)*(1-r_hab)^r_sigc*(r_cnlc-r_hab*(r_cnlc-r_dcnlc))^(-r_sigc) ;
          r_clc = (1-r_tl)*r_wr*r_py/(r_pc*(1+r_tvat))*r_l+r_ben/(r_pc*(1+r_tvat))*(1-r_npart-r_l)+r_trlc/(r_pc*(1+r_tvat))-r_tax/(r_pc*(1+r_tvat))+r_eps_clc ;
          r_lamlc = (1-r_hab)^r_sigc*(r_clc-r_hab*r_clc(-1))^(-r_sigc)/((1+r_tvat)*r_pc/r_py) ;
          r_c = (1-r_slc)*r_cnlc+r_slc*r_clc ;
          r_vl = exp(r_eps_l)*r_omeg*(1-r_l-r_habl*r_l+r_habl*(r_l-r_dl))^r_kappa ;
          r_vl = ((1-r_slc)*r_lamnlc+r_slc*r_lamlc)*((1-r_thetanlc)/(-r_thetanlc)*(r_wr*(1-r_tl)-r_ben/r_py)-1/r_thetanlc*(1-r_npart)/r_l*r_ben/r_py+r_gamw/r_thetanlc*r_wr*r_winf)-(lev*((1-r_slc)*r_lamnlc(1)+r_slc*r_lamlc(1))+(1-lev)*((1-r_slc)*(r_lamnlc+r_dlamnlc(1))+r_slc*(r_lamlc+r_dlamlc(1))))*1/(1+r_theta+r_rho)*r_gamw/r_thetanlc*r_wr/(1+r_infy+r_dinfy(1))*(r_l+r_dl(1))/r_l*(r_sfw*(lev*r_winf(1)+(1-lev)*(r_winf+r_dwinf(1)))+(1-r_sfw)*(r_winf-r_dwinf)) ;
          r_ben = r_benex*r_ex_ben*r_pc*((1+r_tvat)/(1+r_ex_tvat))^r_bentvat/r_py+(1-r_benex)*r_benrr*r_wr*((1-r_tl)/(1-r_ex_tl))^r_bentl*r_py*(r_pc*((1+r_tvat)/(1+r_ex_tvat))^r_bentvat/r_py)^r_benpc+r_eps_ben ;
          r_tr = r_trnom*r_trshare*r_y*r_py+(1-r_trnom)*r_tryshare*r_py+r_eps_tr ;
          r_trlc = r_dumtrlc*r_tr+(1-r_dumtrlc)*r_ex_trlc+r_eps_trlc ;
          r_g = r_gs*r_y*r_py/r_pc+r_eps_gs ;
          r_gs = (1-r_gslag)*r_ex_gs+r_gslag*(r_gs-r_dgs)+r_eps_g ;
          r_ig = r_igs*r_y*r_py/r_pc+r_eps_igs ;
          r_igs = (1-r_igslag)*r_ex_igs+r_igslag*(r_igs-r_digs)+r_eps_ig ;
          (r_gami+r_eps_i)*(r_i/(r_k-r_dk)-(r_delta+w_gtfp+w_gpop))+r_gami2*r_di-r_gami2*1/(1+r_theta+r_rho)*(lev*r_lamnlc(1)+(1-lev)*(r_lamnlc+r_dlamnlc(1)))/r_lamnlc*(1+r_infc+r_dinfc(1))/(1+r_infy+r_dinfy(1))*(lev*(r_i(1)-r_i)+(1-lev)*r_di(1)) = r_q-1 ;
          r_eta*r_py/(r_pc*(1+r_upi))*(1-r_tc)*(1-r_alpha)*(r_y+r_fcy*r_tfp)/r_k+r_tc*r_delta = r_q-(1-r_delta)/(1+r_theta+r_rho)/(1+r_rpremk+r_eps_rpremk)*(lev*r_lamnlc(1)+(1-lev)*(r_lamnlc+r_dlamnlc(1)))/r_lamnlc*(lev*r_q(1)+(1-lev)*(r_q+r_dq(1)))+dyn*(r_a1*(r_ucap-1)+r_a2*(r_ucap-1)^2) ;
          r_wr*(1+r_ssc) = (r_eta*r_alpha*(r_y+r_fcy*r_tfp)/(r_l-r_fcl)-r_gaml*r_wr*r_dl+r_gaml*(lev*r_wr(1)+(1-lev)*(r_wr+r_dwr(1)))/(1+r_theta+r_rho)*(lev*r_lamnlc(1)+(1-lev)*(r_lamnlc+r_dlamnlc(1)))/r_lamnlc*(lev*(r_l(1)-r_l)+(1-lev)*r_dl(1)))/(1+r_eps_w) ;
          r_k = r_i+(1-(r_delta+w_gtfp+w_gpop))*(r_k-r_dk) ;
          r_eta*(1-r_alpha)*(r_y+r_fcy*r_tfp)/r_k = r_pc/r_py*(r_a1+2*r_a2*(r_ucap-1)+r_eps_ucap)*r_ucap ;
          r_eta = 1-(r_tau+r_eps_eta)-r_gamp*(1/(1+r_theta+r_rho)*r_sfp*(lev*r_infy(1)+(1-lev)*(r_infy+r_dinfy(1)))+(1-r_sfp)*(r_infy-r_dinfy)-r_infy) ;
          r_y = (r_s-r_eps_im)*(r_pcy/r_py)^r_sig*(1-r_soil)*(r_pc/r_pcy)^r_sigmaoil*(r_c+r_i*(1+r_upi)^r_sigmaoil+r_g+r_ig)+r_ex+(r_gami+r_eps_i)/2*(r_i/(r_k-r_dk)-(r_delta+w_gtfp+w_gpop))^2*(r_k-r_dk)+r_gami2/2*r_di^2+r_gamp/2*r_infy^2*r_y+r_gamw/2*r_winf^2*r_l+r_gaml/2*r_dl^2*r_wr+R_gamb/2*(R_kbl*R_bs/R_blnlc-1)^2+R_gambd/2*(R_kblf*R_blnlcd/(1/ea_e^EA_gamxr*ea_size/r_size*R_blnlcf)-1)^2 ;
          r_kg = r_ig+(1-(r_deltag+w_gtfp+w_gpop))*(r_kg-r_dkg) ;
          r_y = r_a*(r_ucap*r_k)^(1-r_alpha)*((r_l-r_fcl)*r_tfp)^r_alpha*r_kg^(1-r_alphag)-r_fcy*r_tfp ;
          r_tfp = exp(r_ltfp) ;
          r_ltfp = (1-r_rhotfp)*r_ex_ltfp+r_rhotfp*(r_ltfp-r_dltfp)+r_eps_ltfp ;
          r_o = 1/r_po*(r_py*r_y+r_poil*r_oil+r_poil*r_exoil) ;
          r_oil = r_soil*(r_c+r_i+r_g+r_ig)*(r_poil/r_pc)^(-r_sigmaoil)-r_gamoil*r_doil+r_gamoil*(lev*(r_oil(1)-r_oil)+(1-lev)*r_doil(1)) ;
          r_ygap = (1-r_alpha)*log(r_ucap/r_ex_ucap)+r_alpha*log(r_l/r_ex_l) ;
          r_ex_l = r_llag*(r_ex_l-r_dexl)+(1-r_llag)*r_l ;
          r_ex_ucap = r_ucaplag*(r_ex_ucap-r_dexucap)+(1-r_ucaplag)*r_ucap ;
          r_ex_r = r_rlag*(r_ex_r-r_dexr)+(1-r_rlag)*r_r ;
          r_inom = r_ilag*(r_inom-r_dinom)+(1-r_ilag)*(r_ex_r+r_ex_inf+r_tinf*(r_infc-r_ex_inf)+r_ty*r_ygap)+r_eps_m ;
          r_m/r_py = r_y*(1+r_inom)^(-r_zet) ;
          r_pc = ((1-r_soil)*r_pcy^(1-r_sigmaoil)+r_soil*r_poil^(1-r_sigmaoil))^(1/(1-r_sigmaoil)) ;
          r_pcy = (r_s*r_py^(1-r_sig)+(1-r_s)*r_pim^(1-r_sig))^(1/(1-r_sig)) ;
          r_infy = r_dpy/(r_py-r_dpy) ;
          r_po = r_py*r_py*r_y/(r_py*r_y+r_poil*r_oil+r_poil*r_exoil)+r_poil*r_poil*r_oil/(r_py*r_y+r_poil*r_oil+r_poil*r_exoil)+r_poil*r_poil*r_exoil/(r_py*r_y+r_poil*r_oil+r_poil*r_exoil) ;
          r_wrinf = r_dwr/(r_wr-r_dwr) ;
          r_winf = r_wrinf+r_infy ;
          r_r = r_inom-(lev*r_infy(1)+(1-lev)*(r_infy+r_dinfy(1))) ;
          r_b = r_br*r_py ;
          R_bs/r_py/(1+r_inom+r_rpremb*(r_b/(4*r_y*r_py)-r_ex_by)+r_eps_rpremb) = (R_bs-R_dbs)/(r_py-r_dpy)/(1+r_infy)+r_pc/r_py*r_g+r_pc/r_py*r_ig+(1-r_slc)*r_tr/r_py+r_slc*r_trlc/r_py+r_ben/r_py*(1-r_npart-r_l)-r_tl*r_wr*r_l-r_ssc*r_wr*r_l-r_tvat*r_pc/r_py*r_c-(r_tc*(r_y-(1+r_ssc)*r_wr*r_l)-r_tc*r_delta*r_k*r_pc/r_py)-r_tax/r_py-R_profcb/r_py+(R_bl-R_dbl)/(r_py-r_dpy)/(1+r_infy)*(R_deltabl*R_pbl+R_inoml)-R_bl/r_py*R_pbl ;
          r_gby = -(r_b-(r_b-r_db)/((1+w_gtfp)*(1+w_gpop)*(1+w_coreinf)))/(4*r_py*r_y) ;
          r_by = r_b/4/r_py/r_y ;
          r_tax = r_taxshare*r_y*r_py ;
          r_tl = r_tl-r_dtl+r_taxdum*(r_tgovb1*(r_b/(4*r_y*r_py)-r_btar)+r_tgovb2*r_dbr+r_tgovby*(r_gby-r_ex_gby)+r_tgovinf*(r_infc-r_ex_inf))+r_eps_tl ;
          r_im = (1-r_s+r_eps_im)*(r_pim/r_pc)^(-r_sig)*(1-r_soil)*(r_c+r_i+r_g+r_ig)*(((lev*r_im(1)+(1-lev)*(r_im+r_dim(1)))/r_im)^r_sfim/(r_im/(r_im-r_dim))^(1-r_sfim))^r_gamim ;
          r_tby = (r_px/r_py*r_ex-r_pim/r_py*r_im+r_poil/r_py*r_exoil)*100/r_y ;
          r_bw = -ea_bw*ea_size/r_size ;
          r_bw = r_bwr*r_py ;
          r_px = 1/(1-r_taux-r_eps_etax-r_gampx*(1/(1+r_theta+r_rho)*(r_sfpx*(lev*r_infx(1)+(1-lev)*(r_infx+r_dinfx(1)))+(1-r_sfpx)*(r_infx-r_dinfx))-r_infx))*r_py^r_sxd*r_pc^(1-r_sxd) ;
          r_infx = r_dpx/(r_px-r_dpx) ;
          r_v = (1-r_tc)*(r_y-(1+r_ssc)*r_wr*r_l)+r_tc*r_delta*r_k*r_pc/r_py-r_pc/r_py*r_i+1/(1+r_theta+r_rho)/(1+r_rpremk+r_eps_rpremk)*(lev*r_lamnlc(1)+(1-lev)*(r_lamnlc+r_dlamnlc(1)))/r_lamnlc*(lev*r_v(1)+(1-lev)*(r_v+r_dv(1))) ;
          r_poil = (1-r_poildol)*r_py+r_poildol*r_py*r_e+r_eps_poil ;
          r_tot = r_px/((1-r_soil)*r_pim+r_soil*r_poil) ;
          r_toty = r_px/r_pim ;
          r_nomint = (1+r_inom)*(1+w_gpop)*(1+w_gtfp)*(1+w_coreinf)-1 ;
          r_realint = (1+r_r)*(1+w_gpop)*(1+w_gtfp)-1 ;
          r_inflation = (1+r_infy)*(1+w_coreinf)-1 ;
          r_cay = r_e*(r_bwr-1/((1+w_gtfp)*(1+w_gpop))*(r_bwr-r_dbwr))/r_y*100 ;
          r_dbwr = dyn*(r_bwr-r_bwr(-1))+(1-dyn)*null ;
          r_dpx = dyn*(r_px-r_px(-1))+(1-dyn)*null ;
          r_dex = dyn*(r_ex-r_ex(-1))+(1-dyn)*null ;
          r_dpim = dyn*(r_pim-r_pim(-1))+(1-dyn)*null ;
          r_dim = dyn*(r_im-r_im(-1))+(1-dyn)*null ;
          r_dq = dyn*(r_q-r_q(-1))+(1-dyn)*null ;
          r_dlamnlc = dyn*(r_lamnlc-r_lamnlc(-1))+(1-dyn)*null ;
          r_dlamlc = dyn*(r_lamlc-r_lamlc(-1))+(1-dyn)*null ;
          r_dk = dyn*(r_k-r_k(-1))+(1-dyn)*null ;
          r_dkg = dyn*(r_kg-r_kg(-1))+(1-dyn)*null ;
          r_dl = dyn*(r_l-r_l(-1))+(1-dyn)*null ;
          r_di = dyn*(r_i-r_i(-1))+(1-dyn)*null ;
          r_dcnlc = dyn*(r_cnlc-r_cnlc(-1))+(1-dyn)*null ;
          r_infc = dyn*(r_pc/r_pc(-1)-1)+(1-dyn)*null ;
          r_dinfc = dyn*(r_infc-r_infc(-1))+(1-dyn)*null ;
          r_dinfy = dyn*(r_infy-r_infy(-1))+(1-dyn)*null ;
          r_dinfx = dyn*(r_infx-r_infx(-1))+(1-dyn)*null ;
          r_dwr = dyn*(r_wr-r_wr(-1))+(1-dyn)*null ;
          r_dwinf = dyn*(r_winf-r_winf(-1))+(1-dyn)*null ;
          r_dltfp = dyn*(r_ltfp-r_ltfp(-1))+(1-dyn)*null ;
          r_dgs = dyn*(r_gs-r_gs(-1))+(1-dyn)*null ;
          r_digs = dyn*(r_igs-r_igs(-1))+(1-dyn)*null ;
          r_db = dyn*(r_b-r_b(-1))+(1-dyn)*null ;
          r_dbr = dyn*(r_br-r_br(-1))+(1-dyn)*null ;
          r_dtl = dyn*(r_tl-r_tl(-1))+(1-dyn)*null ;
          r_dv = dyn*(r_v-r_v(-1))+(1-dyn)*null ;
          r_dc = dyn*(r_c-r_c(-1))+(1-dyn)*null ;
          r_dexr = dyn*(r_ex_r-r_ex_r(-1))+(1-dyn)*null ;
          r_dr = dyn*(r_r-r_r(-1))+(1-dyn)*null ;
          r_drealint = dyn*(r_realint-r_realint(-1))+(1-dyn)*null ;
          r_dexl = dyn*(r_ex_l-r_ex_l(-1))+(1-dyn)*null ;
          r_dexucap = dyn*(r_ex_ucap-r_ex_ucap(-1))+(1-dyn)*null ;
          r_dpy = dyn*(r_py-r_py(-1))+(1-dyn)*null ;
          r_dy = dyn*(r_y-r_y(-1))+(1-dyn)*null ;
          r_dinom = dyn*(r_inom-r_inom(-1))+(1-dyn)*null ;
          r_dnomint = dyn*(r_nomint-r_nomint(-1))+(1-dyn)*null ;
          r_doil = dyn*(r_oil-r_oil(-1))+(1-dyn)*null ;
          ea_ex = r_imea*r_size/ea_size ;
          r_imea = r_im1lag*r_imea(-1)+(1-r_im1lag)*r_s_ea*(ea_py*r_e/(ea_e*r_pim))^(-r_sig1)*r_im ;
          ea_pim = ea_pimlag*ea_pim(-1)+(1-ea_pimlag)*(ea_s_r*(r_px*ea_e/r_e)^(1-ea_sig1))^(1/(1-ea_sig1)) ;
          r_ex = ea_imr*ea_size/r_size ;
          ea_imr = ea_im1lag*ea_imr(-1)+(1-ea_im1lag)*ea_s_r*(r_py*ea_e/(r_e*ea_pim))^(-ea_sig1)*ea_im ;
          r_pim = r_pimlag*r_pim(-1)+(1-r_pimlag)*(r_s_ea*(ea_px*r_e/ea_e)^(1-r_sig1))^(1/(1-r_sig1)) ;
          r_exoil = r_e/r_poil*ea_poil/ea_e*ea_oil*ea_size/r_size ;
          1/(1+ea_theta+ea_rho)*(lev*ea_lamnlc(1)+(1-lev)*(ea_lamnlc+ea_dlamnlc(1)))/ea_lamnlc = EA_pbl/(EA_deltabl*(EA_pbl+EA_dpbl(1))+EA_inoml)*(1+ea_infy(1))*(1+EA_gamb/2*(EA_kbl*EA_bs/EA_blnlc-1)^2-EA_gamb*EA_kbl*(EA_kbl*EA_bs/EA_blnlc-1)*EA_bs/EA_blnlc+EA_gambd*EA_kblf*(EA_kblf*EA_blnlcd/(ea_e^EA_gamxr*r_size/ea_size*EA_blnlcf)-1)*ea_e^(1-EA_gamxr)*R_pbl) ;
          1/(1+r_theta+r_rho)*(lev*r_lamnlc(1)+(1-lev)*(r_lamnlc+r_dlamnlc(1)))/r_lamnlc = R_pbl/(R_deltabl*(R_pbl+R_dpbl(1))+R_inoml)*(1+r_infy(1))*(1+R_gamb/2*(R_kbl*R_bs/R_blnlc-1)^2-R_gamb*R_kbl*(R_kbl*R_bs/R_blnlc-1)*R_bs/R_blnlc+R_gambd*R_kblf*(R_kblf*R_blnlcd/(1/ea_e^EA_gamxr*ea_size/r_size*R_blnlcf)-1)*1/ea_e^(1-EA_gamxr)*EA_pbl) ;
          1/(1+ea_theta+ea_rho)*(lev*ea_lamnlc(1)+(1-lev)*(ea_lamnlc+ea_dlamnlc(1)))/ea_lamnlc = R_pbl/(R_deltabl*(R_pbl+R_dpbl(1))+R_inoml)*(1+ea_infy(1))*ea_e/(ea_e+ea_de(1))*(1+EA_gambd/2*(EA_kblf*EA_blnlcd/(ea_e^EA_gamxr*r_size/ea_size*EA_blnlcf)-1)^2-EA_gambd*EA_kblf*(EA_kblf*EA_blnlcd/(ea_e^EA_gamxr*r_size/ea_size*EA_blnlcf)-1)*EA_blnlcd/(ea_e^EA_gamxr*r_size/ea_size*EA_blnlcf)) ;
          1/(1+r_theta+r_rho)*(lev*r_lamnlc(1)+(1-lev)*(r_lamnlc+r_dlamnlc(1)))/r_lamnlc = EA_pbl/(EA_deltabl*(EA_pbl+EA_dpbl(1))+EA_inoml)*(1+r_infy(1))*1/(ea_e/(ea_e+ea_de(1)))*(1+R_gambd/2*(R_kblf*R_blnlcd/(1/ea_e^EA_gamxr*ea_size/r_size*R_blnlcf)-1)^2-R_gambd*R_kblf*(R_kblf*R_blnlcd/(1/ea_e^EA_gamxr*ea_size/r_size*R_blnlcf)-1)*R_blnlcd/(1/ea_e^EA_gamxr*ea_size/r_size*R_blnlcf)) ;
          ea_b = EA_bs+EA_bl ;
          r_b = R_bs+R_bl ;
          EA_bl = EA_blcb+EA_blnlcd+R_blnlcf ;
          R_bl = R_blcb+R_blnlcd+EA_blnlcf ;
          EA_blnlc = EA_blnlcd+ea_e^EA_gamxr*r_size/ea_size*EA_blnlcf ;
          R_blnlc = R_blnlcd+1/ea_e^EA_gamxr*ea_size/r_size*R_blnlcf ;
          EA_bl = EA_sbl*ea_b ;
          R_bl = R_sbl*r_b ;
          EA_blcb = EA_rhoqe*(EA_blcb-EA_dblcb)+EA_tqe*ea_ygap+EA_eps_qe ;
          R_blcb = R_rhoqe*(R_blcb-R_dblcb)+R_tqe*r_ygap+R_eps_qe ;
          EA_profcb = EA_dm-EA_pbl*EA_blcb+(EA_blcb-EA_dblcb)*(EA_deltabl*EA_pbl+EA_inoml) ;
          R_profcb = R_dm-R_pbl*R_blcb+(R_blcb-R_dblcb)*(R_deltabl*R_pbl+R_inoml) ;
          EA_dbs = dyn*(EA_bs-EA_bs(-1))+(1-dyn)*null ;
          EA_dbl = dyn*(EA_bl-EA_bl(-1))+(1-dyn)*null ;
          EA_dblnlcf = dyn*(EA_blnlcf-EA_blnlcf(-1))+(1-dyn)*null ;
          EA_dpbl = dyn*(EA_pbl-EA_pbl(-1))+(1-dyn)*null ;
          EA_dblcb = dyn*(EA_blcb-EA_blcb(-1))+(1-dyn)*null ;
          EA_dm = dyn*(ea_m-ea_m(-1))+(1-dyn)*null ;
          R_dbs = dyn*(R_bs-R_bs(-1))+(1-dyn)*null ;
          R_dbl = dyn*(R_bl-R_bl(-1))+(1-dyn)*null ;
          R_dblnlcf = dyn*(R_blnlcf-R_blnlcf(-1))+(1-dyn)*null ;
          R_dpbl = dyn*(R_pbl-R_pbl(-1))+(1-dyn)*null ;
          R_dblcb = dyn*(R_blcb-R_blcb(-1))+(1-dyn)*null ;
          R_dm = dyn*(r_m-r_m(-1))+(1-dyn)*null ;
          EA_yobs = (ea_s-ea_eps_im)*(ea_pcy/ea_py)^ea_sig*(1-ea_soil)*(ea_pc/ea_pcy)^ea_sigmaoil*(ea_c+ea_i*(1+ea_upi)^ea_sigmaoil+ea_g+ea_ig)+ea_ex ;
          R_yobs = (r_s-r_eps_im)*(r_pcy/r_py)^r_sig*(1-r_soil)*(r_pc/r_pcy)^r_sigmaoil*(r_c+r_i*(1+r_upi)^r_sigmaoil+r_g+r_ig)+r_ex ;
          
end; 
 
initval; 
ea_b=2.4233628861392;
ea_ben=0.347236353606391;
EA_bl=1.2116814430696;
EA_blcb=0;
EA_blnlc=1.2116814430696;
EA_blnlcd=0.48467257722784;
EA_blnlcf=0.147147375811437;
ea_br=2.4233628861392;
EA_bs=1.2116814430696;
ea_bw=0;
ea_bwr=0;
ea_by=0.605840721534799;
ea_c=0.582692901947837;
ea_cay=0;
ea_clc=0.495737892976454;
ea_cnlc=0.64066290792876;
ea_db=0;
EA_dbl=0;
EA_dblcb=0;
EA_dblnlcf=0;
ea_dbr=0;
EA_dbs=0;
ea_dbwr=0;
ea_dc=0;
ea_dcnlc=0;
ea_de=0;
ea_dex=0;
ea_dexl=0;
ea_dexr=0;
ea_dexucap=0;
ea_dgs=0;
ea_di=0;
ea_digs=0;
ea_dim=0;
ea_dinfc=0;
ea_dinfx=0;
ea_dinfy=0;
ea_dinom=0;
ea_dk=0;
ea_dkg=0;
ea_dl=0;
ea_dlamlc=0;
ea_dlamnlc=0;
ea_dltfp=0;
EA_dm=0;
ea_dnomint=0;
ea_doil=0;
EA_dpbl=0;
ea_dpim=0;
ea_dpx=0;
ea_dpy=0;
ea_dq=0;
ea_dr=0;
ea_drealint=0;
ea_dtl=0;
ea_dv=0;
ea_dwinf=0;
ea_dwr=0;
ea_dy=0;
ea_e=1;
ea_eps_gs=0;
ea_eps_igs=0;
ea_eta=0.749999999999999;
ea_ex=0.227372448166589;
ea_ex_l=0.656432118684563;
ea_ex_r=0.00323437285093475;
ea_ex_ucap=1;
ea_f=9.82362345137074;
ea_gby=-0.00556642422085074;
ea_gs=0.18;
ea_i=0.197307098052164;
ea_igs=0.0399999999999997;
ea_im=0.227372448166589;
ea_imr=0.227372448166589;
ea_infc=0;
ea_inflation=0.00499999999999989;
ea_infx=0;
ea_infy=0;
ea_inom=0.00323437285093475;
ea_k=10.2497193793332;
ea_kg=2.38805970149254;
ea_l=0.656432118684563;
ea_lamlc=1.72409829228336;
ea_lamnlc=1.3340882453521;
ea_ltfp=0;
ea_m=0.998709172428258;
ea_nomint=0.0125375000000001;
ea_o=1;
ea_oil=0;
EA_pbl=1;
ea_pc=1;
ea_pcy=1;
ea_pim=1;
ea_po=1;
ea_poil=1;
ea_px=1;
ea_py=1;
ea_q=1;
ea_r=0.00323437285093475;
ea_realint=0.0075;
ea_tax=6.29295472769353e-005;
ea_tby=0;
ea_tfp=1;
ea_tl=0.295462551974026;
ea_tot=1;
ea_toty=1;
ea_tr=0.159999999999999;
ea_trlc=0.159999999999999;
ea_ucap=1;
ea_ucnlc=1.56088324706196;
ea_v=7.40026056523154;
ea_vl=0.247227297618317;
ea_winf=0;
ea_wr=0.868090884015973;
ea_wrinf=0;
ea_y=1;
ea_ygap=0;
EA_yobs=0.999999999999999;
r_b=2.4233628861392;
r_ben=0.347236353606391;
R_bl=1.2116814430696;
R_blcb=0;
R_blnlc=1.2116814430696;
R_blnlcd=1.06453406725816;
R_blnlcf=0.727008865841759;
r_br=2.4233628861392;
R_bs=1.2116814430696;
r_bw=0;
r_bwr=0;
r_by=0.605840721534799;
r_c=0.582692901947837;
r_cay=0;
r_clc=0.495737892976454;
r_cnlc=0.64066290792876;
r_db=0;
R_dbl=0;
R_dblcb=0;
R_dblnlcf=0;
r_dbr=0;
R_dbs=0;
r_dbwr=0;
r_dc=0;
r_dcnlc=0;
r_dex=0;
r_dexl=0;
r_dexr=0;
r_dexucap=0;
r_dgs=0;
r_di=0;
r_digs=0;
r_dim=0;
r_dinfc=0;
r_dinfx=0;
r_dinfy=0;
r_dinom=0;
r_dk=0;
r_dkg=0;
r_dl=0;
r_dlamlc=0;
r_dlamnlc=0;
r_dltfp=0;
R_dm=0;
r_dnomint=0;
r_doil=0;
R_dpbl=0;
r_dpim=0;
r_dpx=0;
r_dpy=0;
r_dq=0;
r_dr=0;
r_drealint=0;
r_dtl=0;
r_dv=0;
r_dwinf=0;
r_dwr=0;
r_dy=0;
r_eps_gs=0;
r_eps_igs=0;
r_eta=0.749999999999999;
r_ex=0.0460204278812987;
r_ex_l=0.656432118684563;
r_ex_r=0.00323437285093475;
r_ex_ucap=1;
r_exoil=0;
r_f=9.82362345137086;
r_gby=-0.00556642422085074;
r_gs=0.18;
r_i=0.197307098052164;
r_igs=0.0399999999999997;
r_im=0.0460204278812987;
r_imea=0.0460204278812987;
r_infc=0;
r_inflation=0.00499999999999989;
r_infx=0;
r_infy=0;
r_inom=0.00323437285093475;
r_k=10.2497193793332;
r_kg=2.38805970149254;
r_l=0.656432118684563;
r_lamlc=1.72409829228336;
r_lamnlc=1.3340882453521;
r_ltfp=0;
r_m=0.998709172428258;
r_nomint=0.0125375000000001;
r_o=1;
r_oil=0;
R_pbl=1;
r_pc=1;
r_pcy=1;
r_pim=1;
r_po=1;
r_poil=1;
R_profcb=0;
r_px=1;
r_py=1;
r_q=1;
r_r=0.00323437285093475;
r_realint=0.0075;
r_tax=6.29295472769353e-005;
r_tby=0;
r_tfp=1;
r_tl=0.295462551974026;
r_tot=1;
r_toty=1;
r_tr=0.159999999999999;
r_trlc=0.159999999999999;
r_ucap=1;
r_ucnlc=1.56088324706196;
r_v=7.40026056523167;
r_vl=0.247222318139285;
r_winf=0;
r_wr=0.868090884015973;
r_wrinf=0;
r_y=1;
r_ygap=0;
R_yobs=1;
ea_a=0.709497806192587;
ea_btar=0.605840721534799;
ea_bwyt=0;
ea_eps_ben=0;
ea_eps_clc=0;
ea_eps_cnlc=0;
ea_eps_eta=0;
ea_eps_etax=0;
ea_eps_g=0;
ea_eps_i=0;
ea_eps_ig=0;
ea_eps_im=0;
ea_eps_l=0;
ea_eps_ltfp=0;
EA_eps_qe=0;
ea_eps_rpremb=0;
ea_eps_rpreme=0;
ea_eps_rpremk=0;
ea_eps_tl=0;
ea_eps_tr=0;
ea_eps_trlc=0;
ea_eps_ucap=0;
ea_eps_v=0;
ea_eps_w=0;
ea_ex_ben=0.347236353606391;
ea_ex_by=0.605840721534799;
ea_ex_gby=-0.0220510402407389;
ea_ex_gs=0.18;
ea_ex_igs=0.0399999999999997;
ea_ex_inf=0;
ea_ex_ltfp=0;
ea_ex_tl=0.295462551974026;
ea_ex_trlc=0.159999999999999;
ea_ex_tvat=0.170000000000001;
ea_fcl=0.0393859271210739;
ea_fcy=0.263589743589742;
ea_g=0.18;
ea_ig=0.0399999999999997;
%ea_ilag=0.819999999999995;
ea_im1lag=0.9;
EA_inoml=0.0282343728509348;
ea_libdum=1;
ea_npart=0.290000000000001;
EA_profcb=0;
ea_rpremb=0;
ea_rpremk=0.00958808614057749;
ea_size=12216375411.7955;
ea_slc=0.400000000000002;
ea_ssc=0.149999999999999;
ea_taxdum=1;
ea_taxshare=6.29295472769353e-005;
ea_tc=0.280000000000001;
%ea_tinf=1.5;
ea_trshare=0.159999999999999;
ea_tryshare=0.159999999999999;
ea_tvat=0.170000000000001;
%ea_ty=0.0500000000000003;
ea_upi=0;
null=0;
r_a=0.709497806192587;
r_btar=0.605840721534799;
r_e=1;
r_eps_ben=0;
r_eps_clc=0;
r_eps_cnlc=0;
r_eps_eta=0;
r_eps_etax=0;
r_eps_g=0;
r_eps_i=0;
r_eps_ig=0;
r_eps_im=0;
r_eps_l=0;
r_eps_ltfp=0;
r_eps_m=0;
r_eps_poil=0;
R_eps_qe=0;
r_eps_rpremb=0;
r_eps_rpremk=0;
r_eps_tl=0;
r_eps_tr=0;
r_eps_trlc=0;
r_eps_ucap=0;
r_eps_v=0;
r_eps_w=0;
r_ex_ben=0.347236353606391;
r_ex_by=0.605840721534799;
r_ex_gby=-0.0220510402407389;
r_ex_gs=0.18;
r_ex_igs=0.0399999999999997;
r_ex_inf=0;
r_ex_ltfp=0;
r_ex_tl=0.295462551974026;
r_ex_trlc=0.159999999999999;
r_ex_tvat=0.170000000000001;
r_fcl=0.0393859271210739;
r_fcy=0.263589743589742;
r_g=0.18;
r_ig=0.0399999999999997;
r_ilag=0.819999999999995;
r_im1lag=0.9;
R_inoml=0.0282343728509348;
r_npart=0.290000000000001;
r_rpremb=0;
r_rpremk=0.00958808614057727;
r_size=60357265522.749;
r_slc=0.400000000000002;
r_ssc=0.149999999999999;
r_taxdum=1;
r_taxshare=6.29295472769353e-005;
r_tc=0.280000000000001;
r_tinf=1.5;
r_trshare=0.159999999999999;
r_tryshare=0.159999999999999;
r_tvat=0.170000000000001;
r_ty=0.0500000000000003;
r_upi=0;
w_coreinf=0.00499999999999997;
w_gpop=0.0005;
w_gtfp=0.00375;
interest=0;
inflation=0;
inflationq=0;
outputgap=0;
output=0;
fispol=0;

end; 
 

%steady; 
 
shocks;
var fiscal_; stderr 1; 
var interest_; stderr 1;
%var EA_eps_qe; stderr 0.01;                
%var ea_eps_ltfp; stderr 0.01; 
end;

%stoch_simul(order=1, nomoments) interest inflationq output outputgap fispol ea_gs ea_eps_gs;


