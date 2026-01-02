; ModuleID = 'src/pl0_1_rt_bigint.cpp'
source_filename = "src/pl0_1_rt_bigint.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

module asm ".globl _ZSt21ios_base_library_initv"

%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }
%"struct.boost::multiprecision::detail::expression" = type { ptr, ptr }
%"struct.boost::multiprecision::detail::expression.0" = type { ptr, ptr }
%"struct.boost::multiprecision::detail::expression.1" = type { ptr }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon.8 }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon.8 = type { i64, [8 x i8] }
%"struct.std::integral_constant" = type { i8 }
%"struct.boost::multiprecision::detail::add_immediates" = type { i8 }
%"struct.boost::multiprecision::detail::subtract_immediates" = type { i8 }
%"struct.std::integral_constant.3" = type { i8 }
%"struct.boost::multiprecision::backends::cpp_int_backend" = type { %"struct.boost::multiprecision::backends::cpp_int_base.base", [5 x i8] }
%"struct.boost::multiprecision::backends::cpp_int_base.base" = type <{ %"union.boost::multiprecision::backends::cpp_int_base<0, 18446744073709551615, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>>::data_type", i64, i8, i8, i8 }>
%"union.boost::multiprecision::backends::cpp_int_base<0, 18446744073709551615, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>>::data_type" = type { i128 }
%"class.std::runtime_error" = type { %"class.std::exception", %"struct.std::__cow_string" }
%"class.std::exception" = type { ptr }
%"struct.std::__cow_string" = type { %union.anon }
%union.anon = type { ptr }
%"struct.boost::multiprecision::detail::negate" = type { i8 }
%"struct.boost::multiprecision::detail::expression.2" = type { ptr }
%"struct.boost::multiprecision::detail::terminal" = type { i8 }
%"class.std::overflow_error" = type { %"class.std::runtime_error" }

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2INS0_6detail14add_immediatesES9_S9_vvEERKNSB_10expressionIT_T0_T1_T2_T3_EEPNSt9enable_ifIXsr3std14is_convertibleINSJ_11result_typeES9_EE5valueEvE4typeE = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2INS0_6detail19subtract_immediatesES9_S9_vvEERKNSB_10expressionIT_T0_T1_T2_T3_EEPNSt9enable_ifIXsr3std14is_convertibleINSJ_11result_typeES9_EE5valueEvE4typeE = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2INS0_6detail6negateES9_vvvEERKNSB_10expressionIT_T0_T1_T2_T3_EEPNSt9enable_ifIXsr3std14is_convertibleINSJ_11result_typeES9_EE5valueEvE4typeE = comdat any

$_ZN5boost14multiprecisionlsINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEERSoS9_RKNS0_6numberIT_XT0_EEE = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2IPKcEERKT_PNSt9enable_ifIXaaaaoooosr5boost14multiprecision6detail13is_arithmeticISD_EE5valuesr3std7is_sameINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESD_EE5valuesr3std14is_convertibleISD_SC_EE5valuentsr6detail25is_explicitly_convertibleINS0_6detail9canonicalISD_S7_E4typeES7_EE5valuesr6detail24is_restricted_conversionISQ_S7_EE5valueEvE4typeE = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEaSINS0_6detail6negateES9_vvvEENSt9enable_ifIXsr3std14is_convertibleINSB_10expressionIT_T0_T1_T2_T3_E11result_typeES9_EE5valueERS9_E4typeERKSK_ = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEaSINS0_6detail14add_immediatesES9_S9_vvEENSt9enable_ifIXsr3std14is_convertibleINSB_10expressionIT_T0_T1_T2_T3_E11result_typeES9_EE5valueERS9_E4typeERKSK_ = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail14add_immediatesES9_S9_vvEEvRKNSB_10expressionIT_T0_T1_T2_T3_EERKSt17integral_constantIbLb1EE = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_14add_immediatesES9_S9_vvEEEEvRKT_RKSD_ = comdat any

$_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_Lm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaaaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT9_EXT10_EXT11_EXT12_ET13_EEEE5valueEvE4typeERS9_RKSB_RKSD_ = comdat any

$_ZN5boost14multiprecision8backends17subtract_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvRT_RKT0_RKT1_ = comdat any

$_ZN5boost14multiprecision8backends12add_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvRT_RKT0_RKT1_ = comdat any

$_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_ = comdat any

$_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb = comdat any

$_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE16compare_unsignedILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EE = comdat any

$_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm = comdat any

$_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE9normalizeEv = comdat any

$_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6negateEv = comdat any

$_ZNSt15__new_allocatorIyE8allocateEmPKv = comdat any

$_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIoEENSt9enable_ifIXaasr3std7is_sameIT_oEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_ = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEaSINS0_6detail19subtract_immediatesES9_S9_vvEENSt9enable_ifIXsr3std14is_convertibleINSB_10expressionIT_T0_T1_T2_T3_E11result_typeES9_EE5valueERS9_E4typeERKSK_ = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail19subtract_immediatesES9_S9_vvEEvRKNSB_10expressionIT_T0_T1_T2_T3_EERKSt17integral_constantIbLb1EE = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_19subtract_immediatesES9_S9_vvEEEEvRKT_RKSD_ = comdat any

$_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_Lm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaaaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT9_EXT10_EXT11_EXT12_ET13_EEEE5valueEvE4typeERS9_RKSB_RKSD_ = comdat any

$_ZN5boost14multiprecision8backends7eval_eqILm0ELm0ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_ELNS0_16cpp_integer_typeE1EXT1_ET2_EEEE5valueEbE4typeERKS9_x = comdat any

$_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSEPKc = comdat any

$_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE16do_assign_stringEPKcRKSt17integral_constantIbLb0EE = comdat any

$_ZN5boost14multiprecision16block_multiplierEm = comdat any

$_ZN5boost14multiprecision8backends13eval_multiplyILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_RKy = comdat any

$_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_RKy = comdat any

$_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev = comdat any

$_ZN5boost14multiprecision8backends13eval_multiplyILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_RKy = comdat any

$_ZN5boost14multiprecision8backends17subtract_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvRT_RKT0_RKy = comdat any

$_ZN5boost14multiprecision8backends12add_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvRT_RKT0_RKy = comdat any

$_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE7do_swapERS6_ = comdat any

$_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6assignERKS6_ = comdat any

$_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIxEENSt9enable_ifIXaasr3std7is_sameIT_xEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_ = comdat any

$_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_ = comdat any

$_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_ = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail6negateES9_vvvEEvRKNSB_10expressionIT_T0_T1_T2_T3_EERKSt17integral_constantIbLb1EE = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_6negateES9_vvvEEEEvRKT_RKSD_ = comdat any

$_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_8terminalES9_vvvEEEEvRKT_RKSD_ = comdat any

$_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE3strB5cxx11ElSt13_Ios_Fmtflags = comdat any

$_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE13do_get_stringB5cxx11ESt13_Ios_FmtflagsRKSt17integral_constantIbLb0EE = comdat any

$_ZN5boost14multiprecision8backends16eval_right_shiftILm0ELm0ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_ELNS0_16cpp_integer_typeE1EXT1_ET2_EEEE5valueEvE4typeERS9_o = comdat any

$_ZNSt7__cxx119to_stringEy = comdat any

$_ZN5boost14multiprecision8backends13eval_get_signILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEiE4typeERKS9_ = comdat any

$_ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvPT_RKT0_RKT1_RS8_ = comdat any

$_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EEC2ERKS6_ = comdat any

$_ZN5boost14multiprecision8backends14eval_incrementILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_ = comdat any

$_ZN5boost14multiprecision8backends16right_shift_byteINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEEvRT_o = comdat any

$_ZN5boost14multiprecision8backends19right_shift_genericINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEEvRT_o = comdat any

$_ZN5boost14multiprecision8backends14eval_decrementILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_ = comdat any

$_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_RKy = comdat any

$_ZNSt8__detail14__to_chars_lenIyEEjT_i = comdat any

$_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE22__resize_and_overwriteIZNS_9to_stringEyEUlPcmE_EEvmT_ = comdat any

$_ZNSt8__detail18__to_chars_10_implIyEEvPcjT_ = comdat any

$_ZN5boost14multiprecision8backends12eval_is_zeroILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEbE4typeERKS9_ = comdat any

$_ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvPT_RKT0_yRS8_ = comdat any

$_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE7compareILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EE = comdat any

$_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE7compareIyEENSt9enable_ifIXsr5boost14multiprecision6detail13is_arithmeticIT_EE5valueEiE4typeES9_ = comdat any

$_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE11compare_impILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EERKSt17integral_constantIbLb0EESF_ = comdat any

@_ZSt4cerr = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str.1 = private unnamed_addr constant [12 x i8] c"0 == borrow\00", align 1
@.str.2 = private unnamed_addr constant [59 x i8] c"/usr/include/boost/multiprecision/cpp_int/add_unsigned.hpp\00", align 1
@__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends17subtract_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvRT_RKT0_RKT1_ = private unnamed_addr constant [288 x i8] c"void boost::multiprecision::backends::subtract_unsigned(CppInt1 &, const CppInt2 &, const CppInt3 &) [CppInt1 = boost::multiprecision::backends::cpp_int_backend<>, CppInt2 = boost::multiprecision::backends::cpp_int_backend<>, CppInt3 = boost::multiprecision::backends::cpp_int_backend<>]\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"!m_alias\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"/usr/include/boost/multiprecision/cpp_int.hpp\00", align 1
@__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm = private unnamed_addr constant [428 x i8] c"void boost::multiprecision::backends::cpp_int_base<0, 18446744073709551615, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>>::resize(std::size_t, std::size_t) [MinBits = 0, MaxBits = 18446744073709551615, SignType = boost::multiprecision::signed_magnitude, Checked = boost::multiprecision::unchecked, Allocator = std::allocator<unsigned long long>, trivial = false]\00", align 1
@.str.5 = private unnamed_addr constant [57 x i8] c"Unexpected content found while parsing character string.\00", align 1
@.str.7 = private unnamed_addr constant [43 x i8] c"Unexpected character encountered in input.\00", align 1
@__const._ZN5boost14multiprecision16block_multiplierEm.values = private unnamed_addr constant [18 x i64] [i64 10, i64 100, i64 1000, i64 10000, i64 100000, i64 1000000, i64 10000000, i64 100000000, i64 1000000000, i64 10000000000, i64 100000000000, i64 1000000000000, i64 10000000000000, i64 100000000000000, i64 1000000000000000, i64 10000000000000000, i64 100000000000000000, i64 1000000000000000000], align 16
@.str.8 = private unnamed_addr constant [28 x i8] c"count < digits_per_block_10\00", align 1
@.str.9 = private unnamed_addr constant [61 x i8] c"/usr/include/boost/multiprecision/cpp_int/cpp_int_config.hpp\00", align 1
@__PRETTY_FUNCTION__._ZN5boost14multiprecision16block_multiplierEm = private unnamed_addr constant [63 x i8] c"limb_type boost::multiprecision::block_multiplier(std::size_t)\00", align 1
@.str.10 = private unnamed_addr constant [60 x i8] c"Base 8 or 16 printing of negative numbers is not supported.\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"0X\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"0x\00", align 1
@.str.15 = private unnamed_addr constant [13 x i8] c"(s % 8) == 0\00", align 1
@.str.16 = private unnamed_addr constant [54 x i8] c"/usr/include/boost/multiprecision/cpp_int/bitwise.hpp\00", align 1
@__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends16right_shift_byteINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEEvRT_o = private unnamed_addr constant [139 x i8] c"void boost::multiprecision::backends::right_shift_byte(Int &, double_limb_type) [Int = boost::multiprecision::backends::cpp_int_backend<>]\00", align 1
@.str.17 = private unnamed_addr constant [6 x i8] c"shift\00", align 1
@__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends19right_shift_genericINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEEvRT_o = private unnamed_addr constant [142 x i8] c"void boost::multiprecision::backends::right_shift_generic(Int &, double_limb_type) [Int = boost::multiprecision::backends::cpp_int_backend<>]\00", align 1
@__const._ZNSt8__detail18__to_chars_10_implIyEEvPcjT_.__digits = private unnamed_addr constant [201 x i8] c"00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\00", align 16
@.str.21 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.22 = private unnamed_addr constant [53 x i8] c"/usr/include/boost/multiprecision/cpp_int/divide.hpp\00", align 1
@__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvPT_RKT0_RKT1_RS8_ = private unnamed_addr constant [304 x i8] c"void boost::multiprecision::backends::divide_unsigned_helper(CppInt1 *, const CppInt2 &, const CppInt3 &, CppInt1 &) [CppInt1 = boost::multiprecision::backends::cpp_int_backend<>, CppInt2 = boost::multiprecision::backends::cpp_int_backend<>, CppInt3 = boost::multiprecision::backends::cpp_int_backend<>]\00", align 1
@.str.23 = private unnamed_addr constant [6 x i8] c"guess\00", align 1
@.str.24 = private unnamed_addr constant [26 x i8] c"r.compare_unsigned(y) < 0\00", align 1
@.str.25 = private unnamed_addr constant [26 x i8] c"Integer Division by zero.\00", align 1
@.str.27 = private unnamed_addr constant [17 x i8] c"r.compare(y) < 0\00", align 1
@__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvPT_RKT0_yRS8_ = private unnamed_addr constant [236 x i8] c"void boost::multiprecision::backends::divide_unsigned_helper(CppInt1 *, const CppInt2 &, limb_type, CppInt1 &) [CppInt1 = boost::multiprecision::backends::cpp_int_backend<>, CppInt2 = boost::multiprecision::backends::cpp_int_backend<>]\00", align 1

; Function Attrs: cold minsize mustprogress noreturn nounwind optsize uwtable
define dso_local void @_ZN5boost15throw_exceptionERKSt9exceptionRKNS_15source_locationE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr nonnull readnone align 8 captures(none) %1) local_unnamed_addr #0 {
  %3 = load ptr, ptr %0, align 8, !tbaa !3
  %4 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %5 = load ptr, ptr %4, align 8
  %6 = tail call noundef ptr %5(ptr noundef nonnull align 8 dereferenceable(8) %0) #18
  %7 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef %6) #19
  %8 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef nonnull @.str) #19
  tail call void @abort() #20
  unreachable
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) local_unnamed_addr #1

; Function Attrs: cold minsize nofree noreturn nounwind optsize
declare dso_local void @abort() local_unnamed_addr #2

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local noalias noundef nonnull ptr @bi_new(i64 noundef %0) local_unnamed_addr #3 {
  %2 = tail call noalias noundef nonnull dereferenceable(32) ptr @_Znwm(i64 noundef 32) #21
  %3 = tail call noundef i64 @llvm.abs.i64(i64 %0, i1 false)
  store i64 %3, ptr %2, align 16, !tbaa !6
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 16
  store i64 1, ptr %4, align 16, !tbaa !8
  %5 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %6 = lshr i64 %0, 63
  %7 = trunc nuw nsw i64 %6 to i8
  store i8 %7, ptr %5, align 8, !tbaa !12
  %8 = getelementptr inbounds nuw i8, ptr %2, i64 25
  store i8 1, ptr %8, align 1, !tbaa !13
  %9 = getelementptr inbounds nuw i8, ptr %2, i64 26
  store i8 0, ptr %9, align 2, !tbaa !14
  ret ptr %2
}

; Function Attrs: minsize nobuiltin optsize allocsize(0)
declare dso_local noalias noundef nonnull ptr @_Znwm(i64 noundef) local_unnamed_addr #4

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local noundef nonnull ptr @bi_add(ptr noundef %0, ptr noundef %1) local_unnamed_addr #3 {
  %3 = alloca %"struct.boost::multiprecision::detail::expression", align 8
  %4 = tail call noalias noundef nonnull dereferenceable(32) ptr @_Znwm(i64 noundef 32) #21
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #22
  store ptr %0, ptr %3, align 8, !tbaa !15, !alias.scope !18
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store ptr %1, ptr %5, align 8, !tbaa !15, !alias.scope !18
  call void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2INS0_6detail14add_immediatesES9_S9_vvEERKNSB_10expressionIT_T0_T1_T2_T3_EEPNSt9enable_ifIXsr3std14is_convertibleINSJ_11result_typeES9_EE5valueEvE4typeE(ptr noundef nonnull align 16 dereferenceable(32) %4, ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef null) #19
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #22
  ret ptr %4
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #5

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2INS0_6detail14add_immediatesES9_S9_vvEERKNSB_10expressionIT_T0_T1_T2_T3_EEPNSt9enable_ifIXsr3std14is_convertibleINSJ_11result_typeES9_EE5valueEvE4typeE(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef %2) unnamed_addr #3 comdat align 2 {
  store i64 0, ptr %0, align 16, !tbaa !6
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store i64 1, ptr %4, align 16, !tbaa !8
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 24
  store i8 0, ptr %5, align 8, !tbaa !12
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 25
  store i8 1, ptr %6, align 1, !tbaa !13
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 26
  store i8 0, ptr %7, align 2, !tbaa !14
  %8 = tail call noundef nonnull align 16 dereferenceable(32) ptr @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEaSINS0_6detail14add_immediatesES9_S9_vvEENSt9enable_ifIXsr3std14is_convertibleINSB_10expressionIT_T0_T1_T2_T3_E11result_typeES9_EE5valueERS9_E4typeERKSK_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) #19
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #5

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local noundef nonnull ptr @bi_sub(ptr noundef %0, ptr noundef %1) local_unnamed_addr #3 {
  %3 = alloca %"struct.boost::multiprecision::detail::expression.0", align 8
  %4 = tail call noalias noundef nonnull dereferenceable(32) ptr @_Znwm(i64 noundef 32) #21
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #22
  store ptr %0, ptr %3, align 8, !tbaa !15, !alias.scope !21
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store ptr %1, ptr %5, align 8, !tbaa !15, !alias.scope !21
  call void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2INS0_6detail19subtract_immediatesES9_S9_vvEERKNSB_10expressionIT_T0_T1_T2_T3_EEPNSt9enable_ifIXsr3std14is_convertibleINSJ_11result_typeES9_EE5valueEvE4typeE(ptr noundef nonnull align 16 dereferenceable(32) %4, ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef null) #19
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #22
  ret ptr %4
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2INS0_6detail19subtract_immediatesES9_S9_vvEERKNSB_10expressionIT_T0_T1_T2_T3_EEPNSt9enable_ifIXsr3std14is_convertibleINSJ_11result_typeES9_EE5valueEvE4typeE(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef %2) unnamed_addr #3 comdat align 2 {
  store i64 0, ptr %0, align 16, !tbaa !6
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store i64 1, ptr %4, align 16, !tbaa !8
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 24
  store i8 0, ptr %5, align 8, !tbaa !12
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 25
  store i8 1, ptr %6, align 1, !tbaa !13
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 26
  store i8 0, ptr %7, align 2, !tbaa !14
  %8 = tail call noundef nonnull align 16 dereferenceable(32) ptr @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEaSINS0_6detail19subtract_immediatesES9_S9_vvEENSt9enable_ifIXsr3std14is_convertibleINSB_10expressionIT_T0_T1_T2_T3_E11result_typeES9_EE5valueERS9_E4typeERKSK_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) #19
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local noundef nonnull ptr @bi_neg(ptr noundef %0) local_unnamed_addr #3 {
  %2 = alloca %"struct.boost::multiprecision::detail::expression.1", align 8
  %3 = tail call noalias noundef nonnull dereferenceable(32) ptr @_Znwm(i64 noundef 32) #21
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #22
  store ptr %0, ptr %2, align 8, !tbaa !15, !alias.scope !24
  call void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2INS0_6detail6negateES9_vvvEERKNSB_10expressionIT_T0_T1_T2_T3_EEPNSt9enable_ifIXsr3std14is_convertibleINSJ_11result_typeES9_EE5valueEvE4typeE(ptr noundef nonnull align 16 dereferenceable(32) %3, ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef null) #19
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #22
  ret ptr %3
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2INS0_6detail6negateES9_vvvEERKNSB_10expressionIT_T0_T1_T2_T3_EEPNSt9enable_ifIXsr3std14is_convertibleINSJ_11result_typeES9_EE5valueEvE4typeE(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef %2) unnamed_addr #3 comdat align 2 {
  store i64 0, ptr %0, align 16, !tbaa !6
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store i64 1, ptr %4, align 16, !tbaa !8
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 24
  store i8 0, ptr %5, align 8, !tbaa !12
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 25
  store i8 1, ptr %6, align 1, !tbaa !13
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 26
  store i8 0, ptr %7, align 2, !tbaa !14
  %8 = tail call noundef nonnull align 16 dereferenceable(32) ptr @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEaSINS0_6detail6negateES9_vvvEENSt9enable_ifIXsr3std14is_convertibleINSB_10expressionIT_T0_T1_T2_T3_E11result_typeES9_EE5valueERS9_E4typeERKSK_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #19
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local range(i32 0, 2) i32 @bi_is_zero(ptr noundef nonnull %0) local_unnamed_addr #3 {
  %2 = tail call noundef zeroext i1 @_ZN5boost14multiprecision8backends7eval_eqILm0ELm0ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_ELNS0_16cpp_integer_typeE1EXT1_ET2_EEEE5valueEbE4typeERKS9_x(ptr noundef nonnull align 16 dereferenceable(32) %0, i64 noundef 0) #18
  %3 = zext i1 %2 to i32
  ret i32 %3
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local void @bi_print(ptr noundef nonnull %0) local_unnamed_addr #3 {
  %2 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZN5boost14multiprecisionlsINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEERSoS9_RKNS0_6numberIT_XT0_EEE(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull align 16 dereferenceable(32) %0) #19
  %3 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef nonnull @.str) #19
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZN5boost14multiprecisionlsINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEERSoS9_RKNS0_6numberIT_XT0_EEE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 16 dereferenceable(32) %1) local_unnamed_addr #1 comdat {
  %3 = alloca %"class.std::__cxx11::basic_string", align 8
  %4 = load ptr, ptr %0, align 8, !tbaa !3
  %5 = getelementptr i8, ptr %4, i64 -24
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %0, i64 %6
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 8
  %9 = load i64, ptr %8, align 8, !tbaa !27
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %3) #22
  %10 = getelementptr inbounds nuw i8, ptr %7, i64 24
  %11 = load i32, ptr %10, align 8, !tbaa !37
  call void @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE3strB5cxx11ElSt13_Ios_Fmtflags(ptr dead_on_unwind nonnull writable sret(%"class.std::__cxx11::basic_string") align 8 %3, ptr noundef nonnull align 16 dereferenceable(32) %1, i64 noundef %9, i32 noundef %11) #19
  %12 = load ptr, ptr %0, align 8, !tbaa !3
  %13 = getelementptr i8, ptr %12, i64 -24
  %14 = load i64, ptr %13, align 8
  %15 = getelementptr inbounds i8, ptr %0, i64 %14
  %16 = getelementptr inbounds nuw i8, ptr %15, i64 16
  %17 = load i64, ptr %16, align 8, !tbaa !38
  %18 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %19 = load i64, ptr %18, align 8, !tbaa !39
  %20 = icmp ult i64 %19, 9223372036854775807
  call void @llvm.assume(i1 %20)
  %21 = icmp sgt i64 %17, %19
  br i1 %21, label %22, label %39

22:                                               ; preds = %2
  %23 = call noundef signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv(ptr noundef nonnull align 8 dereferenceable(264) %15) #19
  %24 = load ptr, ptr %0, align 8, !tbaa !3
  %25 = getelementptr i8, ptr %24, i64 -24
  %26 = load i64, ptr %25, align 8
  %27 = getelementptr inbounds i8, ptr %0, i64 %26
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 24
  %29 = load i32, ptr %28, align 8, !tbaa !37
  %30 = and i32 %29, 32
  %31 = icmp eq i32 %30, 0
  %32 = load i64, ptr %18, align 8, !tbaa !39
  %33 = icmp ult i64 %32, 9223372036854775807
  call void @llvm.assume(i1 %33)
  %34 = sub nsw i64 %17, %32
  br i1 %31, label %37, label %35

35:                                               ; preds = %22
  %36 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEmc(ptr noundef nonnull align 8 dereferenceable(32) %3, i64 noundef %34, i8 noundef signext %23) #19
  br label %39

37:                                               ; preds = %22
  %38 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc(ptr noundef nonnull align 8 dereferenceable(32) %3, i64 noundef 0, i64 noundef %34, i8 noundef signext %23) #19
  br label %39

39:                                               ; preds = %35, %37, %2
  %40 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(32) %3) #19
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv(ptr noundef nonnull align 8 dereferenceable(32) %3) #19
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %3) #22
  ret ptr %40
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local noundef nonnull ptr @bi_from_str(ptr noundef %0) local_unnamed_addr #3 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !43
  %3 = tail call noalias noundef nonnull dereferenceable(32) ptr @_Znwm(i64 noundef 32) #21
  call void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2IPKcEERKT_PNSt9enable_ifIXaaaaoooosr5boost14multiprecision6detail13is_arithmeticISD_EE5valuesr3std7is_sameINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESD_EE5valuesr3std14is_convertibleISD_SC_EE5valuentsr6detail25is_explicitly_convertibleINS0_6detail9canonicalISD_S7_E4typeES7_EE5valuesr6detail24is_restricted_conversionISQ_S7_EE5valueEvE4typeE(ptr noundef nonnull align 16 dereferenceable(32) %3, ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef null) #19
  ret ptr %3
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEC2IPKcEERKT_PNSt9enable_ifIXaaaaoooosr5boost14multiprecision6detail13is_arithmeticISD_EE5valuesr3std7is_sameINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESD_EE5valuesr3std14is_convertibleISD_SC_EE5valuentsr6detail25is_explicitly_convertibleINS0_6detail9canonicalISD_S7_E4typeES7_EE5valuesr6detail24is_restricted_conversionISQ_S7_EE5valueEvE4typeE(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef %2) unnamed_addr #1 comdat align 2 {
  store i64 0, ptr %0, align 16, !tbaa !6
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store i64 1, ptr %4, align 16, !tbaa !8
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 24
  store i8 0, ptr %5, align 8, !tbaa !12
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 25
  store i8 1, ptr %6, align 1, !tbaa !13
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 26
  store i8 0, ptr %7, align 2, !tbaa !14
  %8 = load ptr, ptr %1, align 8, !tbaa !43
  %9 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSEPKc(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef %8) #19
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local void @bi_set(ptr noundef nonnull %0, ptr noundef nonnull %1) local_unnamed_addr #3 {
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6assignERKS6_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 16 dereferenceable(32) %1) #19
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local void @bi_set_i(ptr noundef nonnull %0, i64 noundef %1) local_unnamed_addr #3 {
  %3 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIxEENSt9enable_ifIXaasr3std7is_sameIT_xEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(32) %0, i64 noundef %1) #18
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local void @bi_add_to(ptr noundef nonnull %0, ptr noundef nonnull %1) local_unnamed_addr #3 {
  tail call void @_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 16 dereferenceable(32) %1) #19
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local void @bi_sub_to(ptr noundef nonnull %0, ptr noundef nonnull %1) local_unnamed_addr #3 {
  tail call void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 16 dereferenceable(32) %1) #19
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define dso_local void @bi_neg_in(ptr noundef nonnull %0) local_unnamed_addr #3 {
  %2 = alloca %"struct.boost::multiprecision::detail::expression.1", align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #22
  store ptr %0, ptr %2, align 8, !tbaa !15, !alias.scope !44
  %3 = call noundef nonnull align 16 dereferenceable(32) ptr @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEaSINS0_6detail6negateES9_vvvEENSt9enable_ifIXsr3std14is_convertibleINSB_10expressionIT_T0_T1_T2_T3_E11result_typeES9_EE5valueERS9_E4typeERKSK_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %2) #19
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #22
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef nonnull align 16 dereferenceable(32) ptr @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEaSINS0_6detail6negateES9_vvvEENSt9enable_ifIXsr3std14is_convertibleINSB_10expressionIT_T0_T1_T2_T3_E11result_typeES9_EE5valueERS9_E4typeERKSK_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #3 comdat align 2 {
  %3 = alloca %"struct.std::integral_constant", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %3) #22
  call void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail6negateES9_vvvEEvRKNSB_10expressionIT_T0_T1_T2_T3_EERKSt17integral_constantIbLb1EE(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %3) #19
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %3) #22
  ret ptr %0
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef nonnull align 16 dereferenceable(32) ptr @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEaSINS0_6detail14add_immediatesES9_S9_vvEENSt9enable_ifIXsr3std14is_convertibleINSB_10expressionIT_T0_T1_T2_T3_E11result_typeES9_EE5valueERS9_E4typeERKSK_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) local_unnamed_addr #3 comdat align 2 {
  %3 = alloca %"struct.std::integral_constant", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %3) #22
  call void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail14add_immediatesES9_S9_vvEEvRKNSB_10expressionIT_T0_T1_T2_T3_EERKSt17integral_constantIbLb1EE(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 1 dereferenceable(1) %3) #19
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %3) #22
  ret ptr %0
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail14add_immediatesES9_S9_vvEEvRKNSB_10expressionIT_T0_T1_T2_T3_EERKSt17integral_constantIbLb1EE(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #3 comdat align 2 {
  %4 = alloca %"struct.boost::multiprecision::detail::add_immediates", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #22
  call void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_14add_immediatesES9_S9_vvEEEEvRKT_RKSD_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 1 dereferenceable(1) %4) #19
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #22
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_14add_immediatesES9_S9_vvEEEEvRKT_RKSD_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #3 comdat align 2 {
  %4 = load ptr, ptr %1, align 8, !tbaa !47, !noalias !49, !nonnull !52, !align !53
  %5 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %6 = load ptr, ptr %5, align 8, !tbaa !54, !noalias !55, !nonnull !52, !align !53
  tail call void @_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_Lm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaaaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT9_EXT10_EXT11_EXT12_ET13_EEEE5valueEvE4typeERS9_RKSB_RKSD_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %4, ptr noundef nonnull align 16 dereferenceable(27) %6) #19
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_Lm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaaaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT9_EXT10_EXT11_EXT12_ET13_EEEE5valueEvE4typeERS9_RKSB_RKSD_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %2) local_unnamed_addr #1 comdat {
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %5 = load i8, ptr %4, align 8, !tbaa !12, !range !58, !noundef !52
  %6 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %7 = load i8, ptr %6, align 8, !tbaa !12, !range !58, !noundef !52
  %8 = icmp eq i8 %5, %7
  br i1 %8, label %10, label %9

9:                                                ; preds = %3
  tail call void @_ZN5boost14multiprecision8backends17subtract_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvRT_RKT0_RKT1_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %2) #19
  br label %11

10:                                               ; preds = %3
  tail call void @_ZN5boost14multiprecision8backends12add_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvRT_RKT0_RKT1_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %2) #19
  br label %11

11:                                               ; preds = %10, %9
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends17subtract_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvRT_RKT0_RKT1_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %2) local_unnamed_addr #1 comdat {
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %5 = load i64, ptr %4, align 16, !tbaa !8
  %6 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %7 = load i64, ptr %6, align 16, !tbaa !8
  %8 = tail call i64 @llvm.umin.i64(i64 %5, i64 %7)
  %9 = tail call i64 @llvm.umax.i64(i64 %5, i64 %7)
  %10 = icmp eq i64 %9, 1
  br i1 %10, label %11, label %35

11:                                               ; preds = %3
  %12 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %13 = load i8, ptr %12, align 8, !tbaa !12, !range !58, !noundef !52
  %14 = trunc nuw i8 %13 to i1
  %15 = getelementptr inbounds nuw i8, ptr %1, i64 25
  %16 = load i8, ptr %15, align 1, !tbaa !13, !range !58, !noundef !52
  %17 = trunc nuw i8 %16 to i1
  %18 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %19 = load ptr, ptr %18, align 8
  %20 = select i1 %17, ptr %1, ptr %19
  %21 = load i64, ptr %20, align 8, !tbaa !59
  %22 = getelementptr inbounds nuw i8, ptr %2, i64 25
  %23 = load i8, ptr %22, align 1, !tbaa !13, !range !58, !noundef !52
  %24 = trunc nuw i8 %23 to i1
  %25 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %26 = load ptr, ptr %25, align 8
  %27 = select i1 %24, ptr %2, ptr %26
  %28 = load i64, ptr %27, align 8, !tbaa !59
  %29 = icmp ugt i64 %28, %21
  %30 = tail call i64 @llvm.umax.i64(i64 %28, i64 %21)
  %31 = tail call i64 @llvm.umin.i64(i64 %28, i64 %21)
  %32 = xor i1 %29, %14
  %33 = sub i64 %30, %31
  %34 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %33) #18
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %32) #18
  br label %150

35:                                               ; preds = %3
  %36 = tail call noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE16compare_unsignedILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EE(ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %2) #18
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %9, i64 noundef %9) #19
  %37 = getelementptr inbounds nuw i8, ptr %1, i64 25
  %38 = load i8, ptr %37, align 1, !tbaa !13, !range !58, !noundef !52
  %39 = trunc nuw i8 %38 to i1
  %40 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %41 = load ptr, ptr %40, align 8
  %42 = select i1 %39, ptr %1, ptr %41
  %43 = getelementptr inbounds nuw i8, ptr %2, i64 25
  %44 = load i8, ptr %43, align 1, !tbaa !13, !range !58, !noundef !52
  %45 = trunc nuw i8 %44 to i1
  %46 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %47 = load ptr, ptr %46, align 8
  %48 = select i1 %45, ptr %2, ptr %47
  %49 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %50 = load i8, ptr %49, align 1, !tbaa !13, !range !58, !noundef !52
  %51 = trunc nuw i8 %50 to i1
  %52 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %53 = load ptr, ptr %52, align 8
  %54 = select i1 %51, ptr %0, ptr %53
  %55 = icmp slt i32 %36, 0
  br i1 %55, label %60, label %56

56:                                               ; preds = %35
  %57 = icmp eq i32 %36, 0
  br i1 %57, label %58, label %60

58:                                               ; preds = %56
  %59 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef 0) #18
  br label %150

60:                                               ; preds = %35, %56
  %61 = phi ptr [ %42, %56 ], [ %48, %35 ]
  %62 = phi ptr [ %48, %56 ], [ %42, %35 ]
  br label %63

63:                                               ; preds = %68, %60
  %64 = phi i64 [ 0, %60 ], [ %66, %68 ]
  %65 = phi i8 [ 0, %60 ], [ %103, %68 ]
  %66 = add i64 %64, 4
  %67 = icmp ugt i64 %66, %8
  br i1 %67, label %104, label %68

68:                                               ; preds = %63
  %69 = getelementptr inbounds nuw i64, ptr %61, i64 %64
  %70 = load i64, ptr %69, align 8, !tbaa !59
  %71 = getelementptr inbounds nuw i64, ptr %62, i64 %64
  %72 = load i64, ptr %71, align 8, !tbaa !59
  %73 = getelementptr inbounds nuw i64, ptr %54, i64 %64
  %74 = tail call { i8, i64 } @llvm.x86.subborrow.64(i8 %65, i64 %70, i64 %72)
  %75 = extractvalue { i8, i64 } %74, 1
  store i64 %75, ptr %73, align 8
  %76 = extractvalue { i8, i64 } %74, 0
  %77 = or disjoint i64 %64, 1
  %78 = getelementptr inbounds nuw i64, ptr %61, i64 %77
  %79 = load i64, ptr %78, align 8, !tbaa !59
  %80 = getelementptr inbounds nuw i64, ptr %62, i64 %77
  %81 = load i64, ptr %80, align 8, !tbaa !59
  %82 = getelementptr inbounds nuw i8, ptr %73, i64 8
  %83 = tail call { i8, i64 } @llvm.x86.subborrow.64(i8 %76, i64 %79, i64 %81)
  %84 = extractvalue { i8, i64 } %83, 1
  store i64 %84, ptr %82, align 8
  %85 = extractvalue { i8, i64 } %83, 0
  %86 = or disjoint i64 %64, 2
  %87 = getelementptr inbounds nuw i64, ptr %61, i64 %86
  %88 = load i64, ptr %87, align 8, !tbaa !59
  %89 = getelementptr inbounds nuw i64, ptr %62, i64 %86
  %90 = load i64, ptr %89, align 8, !tbaa !59
  %91 = getelementptr inbounds nuw i8, ptr %73, i64 16
  %92 = tail call { i8, i64 } @llvm.x86.subborrow.64(i8 %85, i64 %88, i64 %90)
  %93 = extractvalue { i8, i64 } %92, 1
  store i64 %93, ptr %91, align 8
  %94 = extractvalue { i8, i64 } %92, 0
  %95 = or disjoint i64 %64, 3
  %96 = getelementptr inbounds nuw i64, ptr %61, i64 %95
  %97 = load i64, ptr %96, align 8, !tbaa !59
  %98 = getelementptr inbounds nuw i64, ptr %62, i64 %95
  %99 = load i64, ptr %98, align 8, !tbaa !59
  %100 = getelementptr inbounds nuw i8, ptr %73, i64 24
  %101 = tail call { i8, i64 } @llvm.x86.subborrow.64(i8 %94, i64 %97, i64 %99)
  %102 = extractvalue { i8, i64 } %101, 1
  store i64 %102, ptr %100, align 8
  %103 = extractvalue { i8, i64 } %101, 0
  br label %63, !llvm.loop !61

104:                                              ; preds = %63, %108
  %105 = phi i64 [ %117, %108 ], [ %64, %63 ]
  %106 = phi i8 [ %116, %108 ], [ %65, %63 ]
  %107 = icmp eq i64 %105, %8
  br i1 %107, label %118, label %108

108:                                              ; preds = %104
  %109 = getelementptr inbounds nuw i64, ptr %61, i64 %105
  %110 = load i64, ptr %109, align 8, !tbaa !59
  %111 = getelementptr inbounds nuw i64, ptr %62, i64 %105
  %112 = load i64, ptr %111, align 8, !tbaa !59
  %113 = getelementptr inbounds nuw i64, ptr %54, i64 %105
  %114 = tail call { i8, i64 } @llvm.x86.subborrow.64(i8 %106, i64 %110, i64 %112)
  %115 = extractvalue { i8, i64 } %114, 1
  store i64 %115, ptr %113, align 8
  %116 = extractvalue { i8, i64 } %114, 0
  %117 = add i64 %105, 1
  br label %104, !llvm.loop !63

118:                                              ; preds = %104, %124
  %119 = phi i64 [ %131, %124 ], [ %8, %104 ]
  %120 = phi i8 [ %130, %124 ], [ %106, %104 ]
  %121 = icmp ne i8 %120, 0
  %122 = icmp ult i64 %119, %9
  %123 = select i1 %121, i1 %122, i1 false
  br i1 %123, label %124, label %132

124:                                              ; preds = %118
  %125 = getelementptr inbounds nuw i64, ptr %61, i64 %119
  %126 = load i64, ptr %125, align 8, !tbaa !59
  %127 = getelementptr inbounds nuw i64, ptr %54, i64 %119
  %128 = tail call { i8, i64 } @llvm.x86.subborrow.64(i8 %120, i64 %126, i64 0)
  %129 = extractvalue { i8, i64 } %128, 1
  store i64 %129, ptr %127, align 8
  %130 = extractvalue { i8, i64 } %128, 0
  %131 = add nuw i64 %119, 1
  br label %118, !llvm.loop !64

132:                                              ; preds = %118
  %133 = icmp eq i64 %9, %119
  %134 = icmp eq ptr %61, %54
  %135 = select i1 %133, i1 true, i1 %134
  br i1 %135, label %142, label %136

136:                                              ; preds = %132
  %137 = shl nuw nsw i64 %119, 3
  %138 = getelementptr inbounds nuw i8, ptr %61, i64 %137
  %139 = getelementptr inbounds nuw i64, ptr %54, i64 %119
  %140 = sub nsw i64 %9, %119
  %141 = shl nsw i64 %140, 3
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %139, ptr align 8 %138, i64 %141, i1 false)
  br label %142

142:                                              ; preds = %136, %132
  %143 = icmp eq i8 %120, 0
  br i1 %143, label %145, label %144

144:                                              ; preds = %142
  tail call void @__assert_fail(ptr noundef nonnull @.str.1, ptr noundef nonnull @.str.2, i32 noundef 354, ptr noundef nonnull @__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends17subtract_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvRT_RKT0_RKT1_) #20
  unreachable

145:                                              ; preds = %142
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE9normalizeEv(ptr noundef nonnull align 16 dereferenceable(27) %0) #18
  %146 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %147 = load i8, ptr %146, align 8, !tbaa !12, !range !58, !noundef !52
  %148 = trunc nuw i8 %147 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %148) #18
  br i1 %55, label %149, label %150

149:                                              ; preds = %145
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6negateEv(ptr noundef nonnull align 16 dereferenceable(27) %0) #18
  br label %150

150:                                              ; preds = %58, %149, %145, %11
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends12add_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvRT_RKT0_RKT1_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %2) local_unnamed_addr #1 comdat {
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %5 = load i64, ptr %4, align 16, !tbaa !8
  %6 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %7 = load i64, ptr %6, align 16, !tbaa !8
  %8 = tail call i64 @llvm.umin.i64(i64 %5, i64 %7)
  %9 = tail call i64 @llvm.umax.i64(i64 %5, i64 %7)
  %10 = icmp eq i64 %9, 1
  %11 = getelementptr inbounds nuw i8, ptr %1, i64 25
  %12 = getelementptr inbounds nuw i8, ptr %1, i64 8
  br i1 %10, label %13, label %32

13:                                               ; preds = %3
  %14 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %15 = load i8, ptr %14, align 8, !tbaa !12, !range !58, !noundef !52
  %16 = load i8, ptr %11, align 1, !tbaa !13, !range !58, !noundef !52
  %17 = trunc nuw i8 %16 to i1
  %18 = load ptr, ptr %12, align 8
  %19 = select i1 %17, ptr %1, ptr %18
  %20 = load i64, ptr %19, align 8, !tbaa !59
  %21 = getelementptr inbounds nuw i8, ptr %2, i64 25
  %22 = load i8, ptr %21, align 1, !tbaa !13, !range !58, !noundef !52
  %23 = trunc nuw i8 %22 to i1
  %24 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %25 = load ptr, ptr %24, align 8
  %26 = select i1 %23, ptr %2, ptr %25
  %27 = load i64, ptr %26, align 8, !tbaa !59
  %28 = add i64 %27, %20
  %29 = icmp ult i64 %28, %20
  %30 = zext i1 %29 to i64
  %31 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIoEENSt9enable_ifIXaasr3std7is_sameIT_oEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %28, i64 noundef %30) #18
  br label %148

32:                                               ; preds = %3
  %33 = icmp ult i64 %5, %7
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %9, i64 noundef %9) #19
  %34 = load i8, ptr %11, align 1, !tbaa !13, !range !58, !noundef !52
  %35 = trunc nuw i8 %34 to i1
  %36 = load ptr, ptr %12, align 8
  %37 = select i1 %35, ptr %1, ptr %36
  %38 = getelementptr inbounds nuw i8, ptr %2, i64 25
  %39 = load i8, ptr %38, align 1, !tbaa !13, !range !58, !noundef !52
  %40 = trunc nuw i8 %39 to i1
  %41 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %42 = load ptr, ptr %41, align 8
  %43 = select i1 %40, ptr %2, ptr %42
  %44 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %45 = load i8, ptr %44, align 1, !tbaa !13, !range !58, !noundef !52
  %46 = trunc nuw i8 %45 to i1
  %47 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %48 = load ptr, ptr %47, align 8
  %49 = select i1 %46, ptr %0, ptr %48
  %50 = select i1 %33, ptr %43, ptr %37
  %51 = select i1 %33, ptr %37, ptr %43
  br label %52

52:                                               ; preds = %57, %32
  %53 = phi i64 [ 0, %32 ], [ %55, %57 ]
  %54 = phi i8 [ 0, %32 ], [ %92, %57 ]
  %55 = add i64 %53, 4
  %56 = icmp ugt i64 %55, %8
  br i1 %56, label %93, label %57

57:                                               ; preds = %52
  %58 = getelementptr inbounds nuw i64, ptr %50, i64 %53
  %59 = load i64, ptr %58, align 8, !tbaa !59
  %60 = getelementptr inbounds nuw i64, ptr %51, i64 %53
  %61 = load i64, ptr %60, align 8, !tbaa !59
  %62 = getelementptr inbounds nuw i64, ptr %49, i64 %53
  %63 = tail call { i8, i64 } @llvm.x86.addcarry.64(i8 %54, i64 %59, i64 %61)
  %64 = extractvalue { i8, i64 } %63, 1
  store i64 %64, ptr %62, align 8
  %65 = extractvalue { i8, i64 } %63, 0
  %66 = or disjoint i64 %53, 1
  %67 = getelementptr inbounds nuw i64, ptr %50, i64 %66
  %68 = load i64, ptr %67, align 8, !tbaa !59
  %69 = getelementptr inbounds nuw i64, ptr %51, i64 %66
  %70 = load i64, ptr %69, align 8, !tbaa !59
  %71 = getelementptr inbounds nuw i8, ptr %62, i64 8
  %72 = tail call { i8, i64 } @llvm.x86.addcarry.64(i8 %65, i64 %68, i64 %70)
  %73 = extractvalue { i8, i64 } %72, 1
  store i64 %73, ptr %71, align 8
  %74 = extractvalue { i8, i64 } %72, 0
  %75 = or disjoint i64 %53, 2
  %76 = getelementptr inbounds nuw i64, ptr %50, i64 %75
  %77 = load i64, ptr %76, align 8, !tbaa !59
  %78 = getelementptr inbounds nuw i64, ptr %51, i64 %75
  %79 = load i64, ptr %78, align 8, !tbaa !59
  %80 = getelementptr inbounds nuw i8, ptr %62, i64 16
  %81 = tail call { i8, i64 } @llvm.x86.addcarry.64(i8 %74, i64 %77, i64 %79)
  %82 = extractvalue { i8, i64 } %81, 1
  store i64 %82, ptr %80, align 8
  %83 = extractvalue { i8, i64 } %81, 0
  %84 = or disjoint i64 %53, 3
  %85 = getelementptr inbounds nuw i64, ptr %50, i64 %84
  %86 = load i64, ptr %85, align 8, !tbaa !59
  %87 = getelementptr inbounds nuw i64, ptr %51, i64 %84
  %88 = load i64, ptr %87, align 8, !tbaa !59
  %89 = getelementptr inbounds nuw i8, ptr %62, i64 24
  %90 = tail call { i8, i64 } @llvm.x86.addcarry.64(i8 %83, i64 %86, i64 %88)
  %91 = extractvalue { i8, i64 } %90, 1
  store i64 %91, ptr %89, align 8
  %92 = extractvalue { i8, i64 } %90, 0
  br label %52, !llvm.loop !65

93:                                               ; preds = %52, %99
  %94 = phi i64 [ %108, %99 ], [ %53, %52 ]
  %95 = phi i8 [ %107, %99 ], [ %54, %52 ]
  %96 = icmp eq i64 %94, %8
  br i1 %96, label %97, label %99

97:                                               ; preds = %93
  %98 = icmp ne i8 %95, 0
  br label %109

99:                                               ; preds = %93
  %100 = getelementptr inbounds nuw i64, ptr %50, i64 %94
  %101 = load i64, ptr %100, align 8, !tbaa !59
  %102 = getelementptr inbounds nuw i64, ptr %51, i64 %94
  %103 = load i64, ptr %102, align 8, !tbaa !59
  %104 = getelementptr inbounds nuw i64, ptr %49, i64 %94
  %105 = tail call { i8, i64 } @llvm.x86.addcarry.64(i8 %95, i64 %101, i64 %103)
  %106 = extractvalue { i8, i64 } %105, 1
  store i64 %106, ptr %104, align 8
  %107 = extractvalue { i8, i64 } %105, 0
  %108 = add i64 %94, 1
  br label %93, !llvm.loop !66

109:                                              ; preds = %97, %114
  %110 = phi i64 [ %121, %114 ], [ %8, %97 ]
  %111 = phi i1 [ %120, %114 ], [ %98, %97 ]
  %112 = icmp ult i64 %110, %9
  %113 = and i1 %112, %111
  br i1 %113, label %114, label %122

114:                                              ; preds = %109
  %115 = getelementptr inbounds nuw i64, ptr %50, i64 %110
  %116 = load i64, ptr %115, align 8, !tbaa !59
  %117 = getelementptr inbounds nuw i64, ptr %49, i64 %110
  %118 = tail call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %116, i64 1)
  %119 = extractvalue { i64, i1 } %118, 0
  %120 = extractvalue { i64, i1 } %118, 1
  store i64 %119, ptr %117, align 8
  %121 = add nuw i64 %110, 1
  br label %109, !llvm.loop !67

122:                                              ; preds = %109
  %123 = icmp eq i64 %110, %9
  %124 = and i1 %123, %111
  br i1 %124, label %125, label %136

125:                                              ; preds = %122
  %126 = add i64 %9, 1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %126, i64 noundef %126) #19
  %127 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %128 = load i64, ptr %127, align 16, !tbaa !8
  %129 = icmp ugt i64 %128, %9
  br i1 %129, label %130, label %145

130:                                              ; preds = %125
  %131 = load i8, ptr %44, align 1, !tbaa !13, !range !58, !noundef !52
  %132 = trunc nuw i8 %131 to i1
  %133 = load ptr, ptr %47, align 8
  %134 = select i1 %132, ptr %0, ptr %133
  %135 = getelementptr inbounds nuw i64, ptr %134, i64 %9
  store i64 1, ptr %135, align 8, !tbaa !59
  br label %145

136:                                              ; preds = %122
  %137 = icmp eq ptr %50, %49
  %138 = select i1 %123, i1 true, i1 %137
  br i1 %138, label %145, label %139

139:                                              ; preds = %136
  %140 = shl nuw nsw i64 %110, 3
  %141 = getelementptr inbounds nuw i8, ptr %50, i64 %140
  %142 = getelementptr inbounds nuw i64, ptr %49, i64 %110
  %143 = sub nsw i64 %9, %110
  %144 = shl nsw i64 %143, 3
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %142, ptr align 8 %141, i64 %144, i1 false)
  br label %145

145:                                              ; preds = %136, %139, %125, %130
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE9normalizeEv(ptr noundef nonnull align 16 dereferenceable(27) %0) #18
  %146 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %147 = load i8, ptr %146, align 8, !tbaa !12, !range !58, !noundef !52
  br label %148

148:                                              ; preds = %145, %13
  %149 = phi i8 [ %147, %145 ], [ %15, %13 ]
  %150 = trunc nuw i8 %149 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %150) #18
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %1) local_unnamed_addr #1 comdat align 2 {
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef 1, i64 noundef 1) #19
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %4 = load i8, ptr %3, align 1, !tbaa !13, !range !58, !noundef !52
  %5 = trunc nuw i8 %4 to i1
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %7 = load ptr, ptr %6, align 8
  %8 = select i1 %5, ptr %0, ptr %7
  store i64 %1, ptr %8, align 8, !tbaa !59
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 24
  store i8 0, ptr %9, align 8, !tbaa !12
  ret ptr %0
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %1) local_unnamed_addr #3 comdat align 2 {
  %3 = zext i1 %1 to i8
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 24
  store i8 %3, ptr %4, align 8, !tbaa !12
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %6 = load i64, ptr %5, align 16
  %7 = icmp eq i64 %6, 1
  %8 = select i1 %1, i1 %7, i1 false
  br i1 %8, label %9, label %19

9:                                                ; preds = %2
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %11 = load i8, ptr %10, align 1, !tbaa !13, !range !58, !noundef !52
  %12 = trunc nuw i8 %11 to i1
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %14 = load ptr, ptr %13, align 8
  %15 = select i1 %12, ptr %0, ptr %14
  %16 = load i64, ptr %15, align 8, !tbaa !59
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %9
  store i8 0, ptr %4, align 8, !tbaa !12
  br label %19

19:                                               ; preds = %9, %18, %2
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE16compare_unsignedILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EE(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1) local_unnamed_addr #3 comdat align 2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %4 = load i64, ptr %3, align 16, !tbaa !8
  %5 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %6 = load i64, ptr %5, align 16, !tbaa !8
  %7 = icmp eq i64 %4, %6
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = icmp ugt i64 %4, %6
  %10 = select i1 %9, i32 1, i32 -1
  br label %37

11:                                               ; preds = %2
  %12 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %13 = load i8, ptr %12, align 1, !tbaa !13, !range !58, !noundef !52
  %14 = trunc nuw i8 %13 to i1
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %16 = load ptr, ptr %15, align 8
  %17 = select i1 %14, ptr %0, ptr %16
  %18 = getelementptr inbounds nuw i8, ptr %1, i64 25
  %19 = load i8, ptr %18, align 1, !tbaa !13, !range !58, !noundef !52
  %20 = trunc nuw i8 %19 to i1
  %21 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %22 = load ptr, ptr %21, align 8
  %23 = select i1 %20, ptr %1, ptr %22
  br label %24

24:                                               ; preds = %27, %11
  %25 = phi i64 [ %4, %11 ], [ %28, %27 ]
  %26 = icmp slt i64 %25, 1
  br i1 %26, label %37, label %27

27:                                               ; preds = %24
  %28 = add nsw i64 %25, -1
  %29 = getelementptr inbounds nuw i64, ptr %17, i64 %28
  %30 = load i64, ptr %29, align 8, !tbaa !59
  %31 = getelementptr inbounds nuw i64, ptr %23, i64 %28
  %32 = load i64, ptr %31, align 8, !tbaa !59
  %33 = icmp eq i64 %30, %32
  br i1 %33, label %24, label %34, !llvm.loop !68

34:                                               ; preds = %27
  %35 = icmp ugt i64 %30, %32
  %36 = select i1 %35, i32 1, i32 -1
  br label %37

37:                                               ; preds = %24, %34, %8
  %38 = phi i32 [ %10, %8 ], [ %36, %34 ], [ 0, %24 ]
  ret i32 %38
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #3 comdat align 2 {
  %4 = tail call i64 @llvm.umin.i64(i64 %1, i64 288230376151711744)
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %6 = load i8, ptr %5, align 1, !tbaa !13, !range !58, !noundef !52
  %7 = trunc nuw i8 %6 to i1
  %8 = load i64, ptr %0, align 16
  %9 = select i1 %7, i64 2, i64 %8
  %10 = icmp ugt i64 %4, %9
  br i1 %10, label %11, label %40

11:                                               ; preds = %3
  %12 = getelementptr inbounds nuw i8, ptr %0, i64 26
  %13 = load i8, ptr %12, align 2, !tbaa !14, !range !58, !noundef !52
  %14 = trunc nuw i8 %13 to i1
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  tail call void @__assert_fail(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.4, i32 noundef 378, ptr noundef nonnull @__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm) #20
  unreachable

16:                                               ; preds = %11
  %17 = shl nuw nsw i64 %9, 2
  %18 = tail call i64 @llvm.umax.i64(i64 %17, i64 %4)
  %19 = tail call i64 @llvm.umin.i64(i64 %18, i64 288230376151711744)
  %20 = tail call noundef ptr @_ZNSt15__new_allocatorIyE8allocateEmPKv(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %19, ptr noundef null) #19
  %21 = load i8, ptr %5, align 1, !tbaa !13, !range !58, !noundef !52
  %22 = trunc nuw i8 %21 to i1
  %23 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %24 = load ptr, ptr %23, align 8
  %25 = select i1 %22, ptr %0, ptr %24
  %26 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %27 = load i64, ptr %26, align 16, !tbaa !8
  %28 = shl i64 %27, 3
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %20, ptr align 8 %25, i64 %28, i1 false)
  %29 = load i8, ptr %5, align 1, !tbaa !13, !range !58, !noundef !52
  %30 = trunc nuw i8 %29 to i1
  %31 = load i8, ptr %12, align 2, !range !58
  %32 = trunc nuw i8 %31 to i1
  %33 = select i1 %30, i1 true, i1 %32
  br i1 %33, label %38, label %34

34:                                               ; preds = %16
  %35 = load ptr, ptr %23, align 8
  %36 = load i64, ptr %0, align 16
  %37 = shl i64 %36, 3
  tail call void @_ZdlPvm(ptr noundef %35, i64 noundef %37) #23
  br label %39

38:                                               ; preds = %16
  store i8 0, ptr %5, align 1, !tbaa !13
  br label %39

39:                                               ; preds = %38, %34
  store i64 %4, ptr %26, align 16, !tbaa !8
  store i64 %19, ptr %0, align 16, !tbaa !6
  store ptr %20, ptr %23, align 8, !tbaa !6
  br label %42

40:                                               ; preds = %3
  %41 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store i64 %4, ptr %41, align 16, !tbaa !8
  br label %42

42:                                               ; preds = %40, %39
  ret void
}

; Function Attrs: cold minsize noreturn nounwind optsize
declare dso_local void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #6

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE9normalizeEv(ptr noundef nonnull align 16 dereferenceable(27) %0) local_unnamed_addr #1 comdat align 2 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %3 = load i8, ptr %2, align 1, !tbaa !13, !range !58, !noundef !52
  %4 = trunc nuw i8 %3 to i1
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %6 = load ptr, ptr %5, align 8
  %7 = select i1 %4, ptr %0, ptr %6
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %9 = load i64, ptr %8, align 16, !tbaa !8
  br label %10

10:                                               ; preds = %18, %1
  %11 = phi i64 [ %12, %18 ], [ %9, %1 ]
  %12 = add i64 %11, -1
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %19, label %14

14:                                               ; preds = %10
  %15 = getelementptr inbounds nuw i64, ptr %7, i64 %12
  %16 = load i64, ptr %15, align 8, !tbaa !59
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %14
  store i64 %12, ptr %8, align 16, !tbaa !8
  br label %10, !llvm.loop !69

19:                                               ; preds = %10, %14
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6negateEv(ptr noundef nonnull align 16 dereferenceable(27) %0) local_unnamed_addr #1 comdat align 2 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %3 = load i8, ptr %2, align 8, !tbaa !12, !range !58, !noundef !52
  %4 = trunc nuw i8 %3 to i1
  %5 = xor i8 %3, 1
  store i8 %5, ptr %2, align 8, !tbaa !12
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %7 = load i64, ptr %6, align 16
  %8 = icmp ne i64 %7, 1
  %9 = select i1 %4, i1 true, i1 %8
  br i1 %9, label %20, label %10

10:                                               ; preds = %1
  %11 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %12 = load i8, ptr %11, align 1, !tbaa !13, !range !58, !noundef !52
  %13 = trunc nuw i8 %12 to i1
  %14 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %15 = load ptr, ptr %14, align 8
  %16 = select i1 %13, ptr %0, ptr %15
  %17 = load i64, ptr %16, align 8, !tbaa !59
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %10
  store i8 0, ptr %2, align 8, !tbaa !12
  br label %20

20:                                               ; preds = %10, %19, %1
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef ptr @_ZNSt15__new_allocatorIyE8allocateEmPKv(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1, ptr noundef %2) local_unnamed_addr #3 comdat align 2 {
  %4 = icmp ugt i64 %1, 1152921504606846975
  br i1 %4, label %5, label %9, !prof !70

5:                                                ; preds = %3
  %6 = icmp ugt i64 %1, 2305843009213693951
  br i1 %6, label %7, label %8

7:                                                ; preds = %5
  tail call void @_ZSt28__throw_bad_array_new_lengthv() #24
  unreachable

8:                                                ; preds = %5
  tail call void @_ZSt17__throw_bad_allocv() #24
  unreachable

9:                                                ; preds = %3
  %10 = shl nuw nsw i64 %1, 3
  %11 = tail call noalias noundef nonnull ptr @_Znwm(i64 noundef %10) #21
  ret ptr %11
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #7

; Function Attrs: minsize noreturn optsize
declare dso_local void @_ZSt28__throw_bad_array_new_lengthv() local_unnamed_addr #8

; Function Attrs: minsize noreturn optsize
declare dso_local void @_ZSt17__throw_bad_allocv() local_unnamed_addr #8

; Function Attrs: minsize nobuiltin nounwind optsize
declare dso_local void @_ZdlPvm(ptr noundef, i64 noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { i8, i64 } @llvm.x86.subborrow.64(i8, i64, i64) #10

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIoEENSt9enable_ifIXaasr3std7is_sameIT_oEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #1 comdat align 2 {
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %5 = load i8, ptr %4, align 1, !tbaa !13, !range !58, !noundef !52
  %6 = trunc nuw i8 %5 to i1
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %8 = load ptr, ptr %7, align 8
  %9 = select i1 %6, ptr %0, ptr %8
  store i64 %1, ptr %9, align 8, !tbaa !59
  %10 = getelementptr inbounds nuw i8, ptr %9, i64 8
  store i64 %2, ptr %10, align 8, !tbaa !59
  %11 = icmp eq i64 %2, 0
  %12 = select i1 %11, i64 1, i64 2
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %12, i64 noundef %12) #19
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 24
  store i8 0, ptr %13, align 8, !tbaa !12
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { i8, i64 } @llvm.x86.addcarry.64(i8, i64, i64) #10

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef nonnull align 16 dereferenceable(32) ptr @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEaSINS0_6detail19subtract_immediatesES9_S9_vvEENSt9enable_ifIXsr3std14is_convertibleINSB_10expressionIT_T0_T1_T2_T3_E11result_typeES9_EE5valueERS9_E4typeERKSK_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) local_unnamed_addr #3 comdat align 2 {
  %3 = alloca %"struct.std::integral_constant", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %3) #22
  call void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail19subtract_immediatesES9_S9_vvEEvRKNSB_10expressionIT_T0_T1_T2_T3_EERKSt17integral_constantIbLb1EE(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 1 dereferenceable(1) %3) #19
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %3) #22
  ret ptr %0
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail19subtract_immediatesES9_S9_vvEEvRKNSB_10expressionIT_T0_T1_T2_T3_EERKSt17integral_constantIbLb1EE(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #3 comdat align 2 {
  %4 = alloca %"struct.boost::multiprecision::detail::subtract_immediates", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #22
  call void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_19subtract_immediatesES9_S9_vvEEEEvRKT_RKSD_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 1 dereferenceable(1) %4) #19
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #22
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_19subtract_immediatesES9_S9_vvEEEEvRKT_RKSD_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #3 comdat align 2 {
  %4 = load ptr, ptr %1, align 8, !tbaa !71, !noalias !73, !nonnull !52, !align !53
  %5 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %6 = load ptr, ptr %5, align 8, !tbaa !76, !noalias !77, !nonnull !52, !align !53
  tail call void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_Lm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaaaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT9_EXT10_EXT11_EXT12_ET13_EEEE5valueEvE4typeERS9_RKSB_RKSD_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %4, ptr noundef nonnull align 16 dereferenceable(27) %6) #19
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_Lm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaaaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT9_EXT10_EXT11_EXT12_ET13_EEEE5valueEvE4typeERS9_RKSB_RKSD_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %2) local_unnamed_addr #1 comdat {
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %5 = load i8, ptr %4, align 8, !tbaa !12, !range !58, !noundef !52
  %6 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %7 = load i8, ptr %6, align 8, !tbaa !12, !range !58, !noundef !52
  %8 = icmp eq i8 %5, %7
  br i1 %8, label %10, label %9

9:                                                ; preds = %3
  tail call void @_ZN5boost14multiprecision8backends12add_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvRT_RKT0_RKT1_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %2) #19
  br label %11

10:                                               ; preds = %3
  tail call void @_ZN5boost14multiprecision8backends17subtract_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvRT_RKT0_RKT1_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %2) #19
  br label %11

11:                                               ; preds = %10, %9
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZN5boost14multiprecision8backends7eval_eqILm0ELm0ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_ELNS0_16cpp_integer_typeE1EXT1_ET2_EEEE5valueEbE4typeERKS9_x(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %1) local_unnamed_addr #1 comdat {
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %4 = load i8, ptr %3, align 8, !tbaa !12, !range !58, !noundef !52
  %5 = trunc nuw i8 %4 to i1
  %6 = icmp sgt i64 %1, -1
  %7 = xor i1 %6, %5
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %9 = load i64, ptr %8, align 16
  %10 = icmp eq i64 %9, 1
  %11 = select i1 %7, i1 %10, i1 false
  br i1 %11, label %12, label %22

12:                                               ; preds = %2
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %14 = load i8, ptr %13, align 1, !tbaa !13, !range !58, !noundef !52
  %15 = trunc nuw i8 %14 to i1
  %16 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %17 = load ptr, ptr %16, align 8
  %18 = select i1 %15, ptr %0, ptr %17
  %19 = load i64, ptr %18, align 8, !tbaa !59
  %20 = tail call noundef i64 @llvm.abs.i64(i64 %1, i1 false)
  %21 = icmp eq i64 %19, %20
  br label %22

22:                                               ; preds = %12, %2
  %23 = phi i1 [ false, %2 ], [ %21, %12 ]
  ret i1 %23
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSEPKc(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef %1) local_unnamed_addr #3 comdat align 2 {
  %3 = alloca %"struct.std::integral_constant.3", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %3) #22
  call void @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE16do_assign_stringEPKcRKSt17integral_constantIbLb0EE(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %3) #19
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %3) #22
  ret ptr %0
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE16do_assign_stringEPKcRKSt17integral_constantIbLb0EE(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #3 comdat align 2 {
  %4 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %5 = alloca %"class.std::runtime_error", align 8
  %6 = alloca %"class.std::runtime_error", align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca %"class.std::runtime_error", align 8
  %10 = icmp eq ptr %1, null
  br i1 %10, label %13, label %11

11:                                               ; preds = %3
  %12 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %1) #25
  br label %13

13:                                               ; preds = %3, %11
  %14 = phi i64 [ %12, %11 ], [ 0, %3 ]
  %15 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef 0) #18
  %16 = icmp eq i64 %14, 0
  br i1 %16, label %41, label %17

17:                                               ; preds = %13
  %18 = load i8, ptr %1, align 1, !tbaa !6
  %19 = icmp eq i8 %18, 45
  br i1 %19, label %20, label %26

20:                                               ; preds = %17
  %21 = add i64 %14, -1
  %22 = getelementptr inbounds nuw i8, ptr %1, i64 1
  %23 = icmp eq i64 %21, 0
  br i1 %23, label %41, label %24

24:                                               ; preds = %20
  %25 = load i8, ptr %22, align 1, !tbaa !6
  br label %26

26:                                               ; preds = %17, %24
  %27 = phi i8 [ %25, %24 ], [ %18, %17 ]
  %28 = phi ptr [ %22, %24 ], [ %1, %17 ]
  %29 = phi i64 [ %21, %24 ], [ %14, %17 ]
  %30 = icmp eq i8 %27, 48
  br i1 %30, label %31, label %41

31:                                               ; preds = %26
  %32 = icmp eq i64 %29, 1
  br i1 %32, label %39, label %33

33:                                               ; preds = %31
  %34 = getelementptr inbounds nuw i8, ptr %28, i64 1
  %35 = load i8, ptr %34, align 1, !tbaa !6
  switch i8 %35, label %39 [
    i8 120, label %36
    i8 88, label %36
  ]

36:                                               ; preds = %33, %33
  %37 = getelementptr inbounds nuw i8, ptr %28, i64 2
  %38 = add i64 %29, -2
  br label %41

39:                                               ; preds = %33, %31
  %40 = add i64 %29, -1
  br label %41

41:                                               ; preds = %13, %36, %39, %26, %20
  %42 = phi i1 [ %19, %36 ], [ %19, %39 ], [ %19, %26 ], [ true, %20 ], [ false, %13 ]
  %43 = phi i1 [ true, %36 ], [ false, %39 ], [ false, %26 ], [ false, %20 ], [ false, %13 ]
  %44 = phi i1 [ false, %36 ], [ true, %39 ], [ false, %26 ], [ false, %20 ], [ false, %13 ]
  %45 = phi i64 [ %38, %36 ], [ %40, %39 ], [ 1, %26 ], [ 0, %20 ], [ 0, %13 ]
  %46 = phi ptr [ %37, %36 ], [ %28, %39 ], [ %28, %26 ], [ %22, %20 ], [ %1, %13 ]
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %4) #22
  store i64 0, ptr %4, align 16, !tbaa !6
  %47 = getelementptr inbounds nuw i8, ptr %4, i64 16
  store i64 1, ptr %47, align 16, !tbaa !8
  %48 = getelementptr inbounds nuw i8, ptr %4, i64 24
  store i8 0, ptr %48, align 8, !tbaa !12
  %49 = getelementptr inbounds nuw i8, ptr %4, i64 25
  store i8 1, ptr %49, align 1, !tbaa !13
  %50 = getelementptr inbounds nuw i8, ptr %4, i64 26
  store i8 0, ptr %50, align 2, !tbaa !14
  %51 = icmp eq i64 %45, 0
  br i1 %51, label %221, label %52

52:                                               ; preds = %41
  br i1 %43, label %53, label %113

53:                                               ; preds = %52, %53
  %54 = phi ptr [ %57, %53 ], [ %46, %52 ]
  %55 = load i8, ptr %54, align 1, !tbaa !6
  %56 = icmp eq i8 %55, 48
  %57 = getelementptr inbounds nuw i8, ptr %54, i64 1
  br i1 %56, label %53, label %58, !llvm.loop !80

58:                                               ; preds = %53
  %59 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %54) #25
  %60 = shl i64 %59, 2
  %61 = tail call i64 @llvm.usub.sat.i64(i64 %60, i64 4)
  %62 = lshr i64 %61, 6
  %63 = add nuw nsw i64 %62, 1
  %64 = and i64 %63, 4294967295
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %4, i64 noundef %64, i64 noundef %64) #19
  %65 = load i8, ptr %49, align 1, !tbaa !13, !range !58, !noundef !52
  %66 = trunc nuw i8 %65 to i1
  %67 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %68 = load ptr, ptr %67, align 8
  %69 = select i1 %66, ptr %4, ptr %68
  %70 = load i64, ptr %47, align 16, !tbaa !8
  %71 = shl i64 %70, 3
  call void @llvm.memset.p0.i64(ptr align 8 %69, i8 0, i64 %71, i1 false)
  %72 = load i64, ptr %47, align 16
  %73 = load i8, ptr %49, align 1, !range !58
  %74 = trunc nuw i8 %73 to i1
  br label %75

75:                                               ; preds = %109, %58
  %76 = phi i64 [ %61, %58 ], [ %111, %109 ]
  %77 = phi ptr [ %54, %58 ], [ %110, %109 ]
  %78 = load i8, ptr %77, align 1, !tbaa !6
  %79 = icmp eq i8 %78, 0
  br i1 %79, label %112, label %80

80:                                               ; preds = %75
  %81 = add i8 %78, -48
  %82 = icmp ult i8 %81, 10
  br i1 %82, label %96, label %83

83:                                               ; preds = %80
  %84 = add i8 %78, -97
  %85 = icmp ult i8 %84, 6
  br i1 %85, label %86, label %89

86:                                               ; preds = %83
  %87 = add nuw nsw i8 %78, 9
  %88 = and i8 %87, 31
  br label %96

89:                                               ; preds = %83
  %90 = add i8 %78, -65
  %91 = icmp ult i8 %90, 6
  br i1 %91, label %92, label %95

92:                                               ; preds = %89
  %93 = add nuw nsw i8 %78, 9
  %94 = and i8 %93, 31
  br label %96

95:                                               ; preds = %89
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %5) #22
  call void @_ZNSt13runtime_errorC1EPKc(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef nonnull @.str.5) #18
  call void @_ZN5boost15throw_exceptionERKSt9exceptionRKNS_15source_locationE(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr nonnull align 8 poison) #26
  unreachable

96:                                               ; preds = %80, %86, %92
  %97 = phi i8 [ %88, %86 ], [ %94, %92 ], [ %81, %80 ]
  %98 = lshr i64 %76, 6
  %99 = icmp ugt i64 %72, %98
  br i1 %99, label %100, label %109

100:                                              ; preds = %96
  %101 = zext nneg i8 %97 to i64
  %102 = and i64 %76, 60
  %103 = shl nuw i64 %101, %102
  %104 = load ptr, ptr %67, align 8
  %105 = select i1 %74, ptr %4, ptr %104
  %106 = getelementptr inbounds nuw i64, ptr %105, i64 %98
  %107 = load i64, ptr %106, align 8, !tbaa !59
  %108 = or i64 %107, %103
  store i64 %108, ptr %106, align 8, !tbaa !59
  br label %109

109:                                              ; preds = %100, %96
  %110 = getelementptr inbounds nuw i8, ptr %77, i64 1
  %111 = add i64 %76, -4
  br label %75, !llvm.loop !81

112:                                              ; preds = %75
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE9normalizeEv(ptr noundef nonnull align 16 dereferenceable(27) %4) #18
  br label %221

113:                                              ; preds = %52
  br i1 %44, label %114, label %190

114:                                              ; preds = %113, %114
  %115 = phi ptr [ %118, %114 ], [ %46, %113 ]
  %116 = load i8, ptr %115, align 1, !tbaa !6
  %117 = icmp eq i8 %116, 48
  %118 = getelementptr inbounds nuw i8, ptr %115, i64 1
  br i1 %117, label %114, label %119, !llvm.loop !82

119:                                              ; preds = %114
  %120 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %115) #25
  %121 = mul i64 %120, 3
  %122 = tail call i64 @llvm.usub.sat.i64(i64 %121, i64 3)
  %123 = lshr i64 %122, 6
  %124 = add nuw nsw i64 %123, 1
  %125 = and i64 %124, 4294967295
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %4, i64 noundef %125, i64 noundef %125) #19
  %126 = load i8, ptr %49, align 1, !tbaa !13, !range !58, !noundef !52
  %127 = trunc nuw i8 %126 to i1
  %128 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %129 = load ptr, ptr %128, align 8
  %130 = select i1 %127, ptr %4, ptr %129
  %131 = load i64, ptr %47, align 16, !tbaa !8
  %132 = shl i64 %131, 3
  call void @llvm.memset.p0.i64(ptr align 8 %130, i8 0, i64 %132, i1 false)
  %133 = add nuw nsw i64 %123, 2
  %134 = and i64 %133, 4294967295
  br label %135

135:                                              ; preds = %186, %119
  %136 = phi i64 [ %122, %119 ], [ %188, %186 ]
  %137 = phi ptr [ %115, %119 ], [ %187, %186 ]
  %138 = load i8, ptr %137, align 1, !tbaa !6
  %139 = icmp eq i8 %138, 0
  br i1 %139, label %189, label %140

140:                                              ; preds = %135
  %141 = and i8 %138, -8
  %142 = icmp eq i8 %141, 48
  br i1 %142, label %143, label %150

143:                                              ; preds = %140
  %144 = add nsw i8 %138, -48
  %145 = zext nneg i8 %144 to i64
  %146 = lshr i64 %136, 6
  %147 = and i64 %136, 63
  %148 = load i64, ptr %47, align 16, !tbaa !8
  %149 = icmp ugt i64 %148, %146
  br i1 %149, label %151, label %186

150:                                              ; preds = %140
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %6) #22
  call void @_ZNSt13runtime_errorC1EPKc(ptr noundef nonnull align 8 dereferenceable(16) %6, ptr noundef nonnull @.str.5) #18
  call void @_ZN5boost15throw_exceptionERKSt9exceptionRKNS_15source_locationE(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr nonnull align 8 poison) #26
  unreachable

151:                                              ; preds = %143
  %152 = shl i64 %145, %147
  %153 = load i8, ptr %49, align 1, !tbaa !13, !range !58, !noundef !52
  %154 = trunc nuw i8 %153 to i1
  %155 = load ptr, ptr %128, align 8
  %156 = select i1 %154, ptr %4, ptr %155
  %157 = getelementptr inbounds nuw i64, ptr %156, i64 %146
  %158 = load i64, ptr %157, align 8, !tbaa !59
  %159 = or i64 %158, %152
  store i64 %159, ptr %157, align 8, !tbaa !59
  %160 = icmp samesign ugt i64 %147, 61
  br i1 %160, label %161, label %186

161:                                              ; preds = %151
  %162 = sub nuw nsw i64 64, %147
  %163 = lshr i64 %145, %162
  %164 = icmp eq i64 %163, 0
  br i1 %164, label %186, label %165

165:                                              ; preds = %161
  %166 = add nuw nsw i64 %146, 1
  %167 = icmp eq i64 %146, %123
  br i1 %167, label %168, label %175

168:                                              ; preds = %165
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %4, i64 noundef %134, i64 noundef %134) #19
  %169 = load i8, ptr %49, align 1, !tbaa !13, !range !58, !noundef !52
  %170 = trunc nuw i8 %169 to i1
  %171 = load ptr, ptr %128, align 8
  %172 = select i1 %170, ptr %4, ptr %171
  %173 = getelementptr inbounds nuw i64, ptr %172, i64 %166
  store i64 0, ptr %173, align 8, !tbaa !59
  %174 = load i64, ptr %47, align 16, !tbaa !8
  br label %175

175:                                              ; preds = %168, %165
  %176 = phi i8 [ %169, %168 ], [ %153, %165 ]
  %177 = phi i64 [ %174, %168 ], [ %148, %165 ]
  %178 = icmp ugt i64 %177, %166
  br i1 %178, label %179, label %186

179:                                              ; preds = %175
  %180 = trunc nuw i8 %176 to i1
  %181 = load ptr, ptr %128, align 8
  %182 = select i1 %180, ptr %4, ptr %181
  %183 = getelementptr inbounds nuw i64, ptr %182, i64 %166
  %184 = load i64, ptr %183, align 8, !tbaa !59
  %185 = or i64 %184, %163
  store i64 %185, ptr %183, align 8, !tbaa !59
  br label %186

186:                                              ; preds = %151, %175, %179, %161, %143
  %187 = getelementptr inbounds nuw i8, ptr %137, i64 1
  %188 = add i64 %136, -3
  br label %135, !llvm.loop !83

189:                                              ; preds = %135
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE9normalizeEv(ptr noundef nonnull align 16 dereferenceable(27) %4) #18
  br label %221

190:                                              ; preds = %113
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7) #22
  store i64 1000000000000000000, ptr %7, align 8, !tbaa !59
  br label %191

191:                                              ; preds = %218, %190
  %192 = phi ptr [ %46, %190 ], [ %219, %218 ]
  %193 = load i8, ptr %192, align 1, !tbaa !6
  %194 = icmp eq i8 %193, 0
  br i1 %194, label %220, label %195

195:                                              ; preds = %191
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %8) #22
  store i64 0, ptr %8, align 8, !tbaa !59
  br label %196

196:                                              ; preds = %216, %195
  %197 = phi i64 [ 0, %195 ], [ %208, %216 ]
  %198 = phi ptr [ %192, %195 ], [ %209, %216 ]
  %199 = phi i32 [ 0, %195 ], [ %217, %216 ]
  %200 = icmp eq i32 %199, 18
  br i1 %200, label %218, label %201

201:                                              ; preds = %196
  %202 = load i8, ptr %198, align 1, !tbaa !6
  %203 = add i8 %202, -48
  %204 = icmp ult i8 %203, 10
  br i1 %204, label %205, label %212

205:                                              ; preds = %201
  %206 = zext nneg i8 %203 to i64
  %207 = mul i64 %197, 10
  %208 = add i64 %207, %206
  store i64 %208, ptr %8, align 8, !tbaa !59
  %209 = getelementptr inbounds nuw i8, ptr %198, i64 1
  %210 = load i8, ptr %209, align 1, !tbaa !6
  %211 = icmp eq i8 %210, 0
  br i1 %211, label %213, label %216

212:                                              ; preds = %201
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %9) #22
  call void @_ZNSt13runtime_errorC1EPKc(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull @.str.7) #18
  call void @_ZN5boost15throw_exceptionERKSt9exceptionRKNS_15source_locationE(ptr noundef nonnull align 8 dereferenceable(8) %9, ptr nonnull align 8 poison) #26
  unreachable

213:                                              ; preds = %205
  %214 = zext nneg i32 %199 to i64
  %215 = call noundef i64 @_ZN5boost14multiprecision16block_multiplierEm(i64 noundef %214) #19
  store i64 %215, ptr %7, align 8, !tbaa !59
  br label %218

216:                                              ; preds = %205
  %217 = add nuw nsw i32 %199, 1
  br label %196, !llvm.loop !84

218:                                              ; preds = %196, %213
  %219 = phi ptr [ %209, %213 ], [ %198, %196 ]
  call void @_ZN5boost14multiprecision8backends13eval_multiplyILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_RKy(ptr noundef nonnull align 16 dereferenceable(27) %4, ptr noundef nonnull align 8 dereferenceable(8) %7) #19
  call void @_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_RKy(ptr noundef nonnull align 16 dereferenceable(27) %4, ptr noundef nonnull align 8 dereferenceable(8) %8) #19
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %8) #22
  br label %191, !llvm.loop !85

220:                                              ; preds = %191
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7) #22
  br label %221

221:                                              ; preds = %112, %220, %189, %41
  br i1 %42, label %222, label %223

222:                                              ; preds = %221
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6negateEv(ptr noundef nonnull align 16 dereferenceable(27) %4) #18
  br label %223

223:                                              ; preds = %222, %221
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE7do_swapERS6_(ptr noundef nonnull align 16 dereferenceable(27) %4, ptr noundef nonnull align 16 dereferenceable(27) %0) #18
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %4) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %4) #22
  ret void
}

; Function Attrs: minsize mustprogress nocallback nofree nounwind optsize willreturn memory(argmem: read)
declare dso_local i64 @strlen(ptr noundef captures(none)) local_unnamed_addr #11

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #12

; Function Attrs: minsize optsize
declare dso_local void @_ZNSt13runtime_errorC1EPKc(ptr noundef nonnull align 8 dereferenceable(16), ptr noundef) unnamed_addr #13

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef i64 @_ZN5boost14multiprecision16block_multiplierEm(i64 noundef %0) local_unnamed_addr #1 comdat {
  %2 = icmp ult i64 %0, 18
  br i1 %2, label %4, label %3

3:                                                ; preds = %1
  tail call void @__assert_fail(ptr noundef nonnull @.str.8, ptr noundef nonnull @.str.9, i32 noundef 116, ptr noundef nonnull @__PRETTY_FUNCTION__._ZN5boost14multiprecision16block_multiplierEm) #20
  unreachable

4:                                                ; preds = %1
  %5 = getelementptr inbounds nuw [18 x i64], ptr @__const._ZN5boost14multiprecision16block_multiplierEm.values, i64 0, i64 %0
  %6 = load i64, ptr %5, align 8, !tbaa !59
  ret i64 %6
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends13eval_multiplyILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #1 comdat {
  tail call void @_ZN5boost14multiprecision8backends13eval_multiplyILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #19
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #1 comdat {
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %4 = load i8, ptr %3, align 8, !tbaa !12, !range !58, !noundef !52
  %5 = trunc nuw i8 %4 to i1
  br i1 %5, label %6, label %7

6:                                                ; preds = %2
  tail call void @_ZN5boost14multiprecision8backends17subtract_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvRT_RKT0_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #19
  br label %8

7:                                                ; preds = %2
  tail call void @_ZN5boost14multiprecision8backends12add_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvRT_RKT0_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #19
  br label %8

8:                                                ; preds = %7, %6
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %0) unnamed_addr #1 comdat align 2 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %3 = load i8, ptr %2, align 1, !tbaa !13, !range !58, !noundef !52
  %4 = trunc nuw i8 %3 to i1
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 26
  %6 = load i8, ptr %5, align 2, !range !58
  %7 = trunc nuw i8 %6 to i1
  %8 = select i1 %4, i1 true, i1 %7
  br i1 %8, label %14, label %9

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %11 = load ptr, ptr %10, align 8
  %12 = load i64, ptr %0, align 16
  %13 = shl i64 %12, 3
  tail call void @_ZdlPvm(ptr noundef %11, i64 noundef %13) #23
  br label %14

14:                                               ; preds = %9, %1
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends13eval_multiplyILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) local_unnamed_addr #1 comdat {
  %4 = load i64, ptr %2, align 8, !tbaa !59
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %3
  %7 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef 0) #18
  br label %62

8:                                                ; preds = %3
  %9 = icmp eq ptr %1, %0
  br i1 %9, label %13, label %10

10:                                               ; preds = %8
  %11 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %12 = load i64, ptr %11, align 16, !tbaa !8
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %12, i64 noundef %12) #19
  br label %13

13:                                               ; preds = %10, %8
  %14 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %15 = load i8, ptr %14, align 1, !tbaa !13, !range !58, !noundef !52
  %16 = trunc nuw i8 %15 to i1
  %17 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %18 = load ptr, ptr %17, align 8
  %19 = select i1 %16, ptr %0, ptr %18
  %20 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %21 = load i64, ptr %20, align 16, !tbaa !8
  %22 = getelementptr inbounds nuw i64, ptr %19, i64 %21
  %23 = getelementptr inbounds nuw i8, ptr %1, i64 25
  %24 = load i8, ptr %23, align 1, !tbaa !13, !range !58, !noundef !52
  %25 = trunc nuw i8 %24 to i1
  %26 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %27 = load ptr, ptr %26, align 8
  %28 = select i1 %25, ptr %1, ptr %27
  br label %29

29:                                               ; preds = %34, %13
  %30 = phi ptr [ %19, %13 ], [ %43, %34 ]
  %31 = phi ptr [ %28, %13 ], [ %44, %34 ]
  %32 = phi i128 [ 0, %13 ], [ %42, %34 ]
  %33 = icmp eq ptr %30, %22
  br i1 %33, label %45, label %34

34:                                               ; preds = %29
  %35 = load i64, ptr %31, align 8, !tbaa !59
  %36 = zext i64 %35 to i128
  %37 = load i64, ptr %2, align 8, !tbaa !59
  %38 = zext i64 %37 to i128
  %39 = mul nuw i128 %38, %36
  %40 = add nuw i128 %39, %32
  %41 = trunc i128 %40 to i64
  store i64 %41, ptr %30, align 8, !tbaa !59
  %42 = lshr i128 %40, 64
  %43 = getelementptr inbounds nuw i8, ptr %30, i64 8
  %44 = getelementptr inbounds nuw i8, ptr %31, i64 8
  br label %29, !llvm.loop !86

45:                                               ; preds = %29
  %46 = icmp eq i128 %32, 0
  br i1 %46, label %58, label %47

47:                                               ; preds = %45
  %48 = add i64 %21, 1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %48, i64 noundef %48) #19
  %49 = load i64, ptr %20, align 16, !tbaa !8
  %50 = icmp ugt i64 %49, %21
  br i1 %50, label %51, label %58

51:                                               ; preds = %47
  %52 = trunc nuw i128 %32 to i64
  %53 = load i8, ptr %14, align 1, !tbaa !13, !range !58, !noundef !52
  %54 = trunc nuw i8 %53 to i1
  %55 = load ptr, ptr %17, align 8
  %56 = select i1 %54, ptr %0, ptr %55
  %57 = getelementptr inbounds nuw i64, ptr %56, i64 %21
  store i64 %52, ptr %57, align 8, !tbaa !59
  br label %58

58:                                               ; preds = %47, %51, %45
  %59 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %60 = load i8, ptr %59, align 8, !tbaa !12, !range !58, !noundef !52
  %61 = trunc nuw i8 %60 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %61) #18
  br label %62

62:                                               ; preds = %58, %6
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends17subtract_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvRT_RKT0_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) local_unnamed_addr #1 comdat {
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %5 = load i64, ptr %4, align 16, !tbaa !8
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %5, i64 noundef %5) #19
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %7 = load i8, ptr %6, align 1, !tbaa !13, !range !58, !noundef !52
  %8 = trunc nuw i8 %7 to i1
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %10 = load ptr, ptr %9, align 8
  %11 = select i1 %8, ptr %0, ptr %10
  %12 = getelementptr inbounds nuw i8, ptr %1, i64 25
  %13 = load i8, ptr %12, align 1, !tbaa !13, !range !58, !noundef !52
  %14 = trunc nuw i8 %13 to i1
  %15 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %16 = load ptr, ptr %15, align 8
  %17 = select i1 %14, ptr %1, ptr %16
  %18 = load i64, ptr %17, align 8, !tbaa !59
  %19 = load i64, ptr %2, align 8, !tbaa !59
  %20 = icmp ult i64 %18, %19
  br i1 %20, label %41, label %21

21:                                               ; preds = %3
  %22 = sub nuw i64 %18, %19
  store i64 %22, ptr %11, align 8, !tbaa !59
  %23 = icmp eq ptr %0, %1
  br i1 %23, label %33, label %24

24:                                               ; preds = %21
  %25 = getelementptr inbounds nuw i8, ptr %17, i64 8
  %26 = load i64, ptr %4, align 16, !tbaa !8
  %27 = shl nuw nsw i64 %26, 3
  %28 = getelementptr inbounds nuw i8, ptr %11, i64 8
  %29 = add nsw i64 %27, -8
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 8 %28, ptr nonnull align 8 %25, i64 %29, i1 false)
  %30 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %31 = load i8, ptr %30, align 8, !tbaa !12, !range !58, !noundef !52
  %32 = trunc nuw i8 %31 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %32) #18
  br label %77

33:                                               ; preds = %21
  %34 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %35 = load i64, ptr %34, align 16, !tbaa !8
  %36 = icmp eq i64 %35, 1
  %37 = icmp eq i64 %18, %19
  %38 = and i1 %37, %36
  br i1 %38, label %39, label %77

39:                                               ; preds = %33
  %40 = getelementptr inbounds nuw i8, ptr %0, i64 24
  store i8 0, ptr %40, align 8, !tbaa !12
  br label %77

41:                                               ; preds = %3
  %42 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %43 = load i64, ptr %42, align 16, !tbaa !8
  %44 = icmp eq i64 %43, 1
  br i1 %44, label %45, label %51

45:                                               ; preds = %41
  %46 = sub i64 %19, %18
  store i64 %46, ptr %11, align 8, !tbaa !59
  %47 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %48 = load i8, ptr %47, align 8, !tbaa !12, !range !58, !noundef !52
  %49 = trunc nuw i8 %48 to i1
  %50 = xor i1 %49, true
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %50) #18
  br label %77

51:                                               ; preds = %41
  %52 = sub i64 %18, %19
  store i64 %52, ptr %11, align 8, !tbaa !59
  br label %53

53:                                               ; preds = %58, %51
  %54 = phi i64 [ 1, %51 ], [ %60, %58 ]
  %55 = getelementptr inbounds nuw i64, ptr %17, i64 %54
  %56 = load i64, ptr %55, align 8, !tbaa !59
  %57 = icmp eq i64 %56, 0
  br i1 %57, label %58, label %61

58:                                               ; preds = %53
  %59 = getelementptr inbounds nuw i64, ptr %11, i64 %54
  store i64 -1, ptr %59, align 8, !tbaa !59
  %60 = add i64 %54, 1
  br label %53, !llvm.loop !87

61:                                               ; preds = %53
  %62 = add i64 %56, -1
  %63 = getelementptr inbounds nuw i64, ptr %11, i64 %54
  store i64 %62, ptr %63, align 8, !tbaa !59
  %64 = icmp eq ptr %0, %1
  br i1 %64, label %73, label %65

65:                                               ; preds = %61
  %66 = add i64 %54, 1
  %67 = shl nuw nsw i64 %66, 3
  %68 = getelementptr inbounds nuw i8, ptr %17, i64 %67
  %69 = load i64, ptr %4, align 16, !tbaa !8
  %70 = getelementptr inbounds nuw i64, ptr %11, i64 %66
  %71 = sub nsw i64 %69, %66
  %72 = shl nsw i64 %71, 3
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 8 %70, ptr nonnull align 8 %68, i64 %72, i1 false)
  br label %73

73:                                               ; preds = %65, %61
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE9normalizeEv(ptr noundef nonnull align 16 dereferenceable(27) %0) #18
  %74 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %75 = load i8, ptr %74, align 8, !tbaa !12, !range !58, !noundef !52
  %76 = trunc nuw i8 %75 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %76) #18
  br label %77

77:                                               ; preds = %45, %73, %24, %39, %33
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends12add_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvRT_RKT0_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) local_unnamed_addr #1 comdat {
  %4 = icmp eq ptr %0, %1
  br i1 %4, label %8, label %5

5:                                                ; preds = %3
  %6 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %7 = load i64, ptr %6, align 16, !tbaa !8
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %7, i64 noundef %7) #19
  br label %8

8:                                                ; preds = %5, %3
  %9 = load i64, ptr %2, align 8, !tbaa !59
  %10 = zext i64 %9 to i128
  %11 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %12 = load i8, ptr %11, align 1, !tbaa !13, !range !58, !noundef !52
  %13 = trunc nuw i8 %12 to i1
  %14 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %15 = load ptr, ptr %14, align 8
  %16 = select i1 %13, ptr %0, ptr %15
  %17 = getelementptr inbounds nuw i8, ptr %1, i64 25
  %18 = load i8, ptr %17, align 1, !tbaa !13, !range !58, !noundef !52
  %19 = trunc nuw i8 %18 to i1
  %20 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %21 = load ptr, ptr %20, align 8
  %22 = select i1 %19, ptr %1, ptr %21
  %23 = getelementptr inbounds nuw i8, ptr %0, i64 16
  br label %24

24:                                               ; preds = %31, %8
  %25 = phi i64 [ 0, %8 ], [ %39, %31 ]
  %26 = phi i128 [ %10, %8 ], [ %38, %31 ]
  %27 = icmp ne i128 %26, 0
  %28 = load i64, ptr %23, align 16
  %29 = icmp ult i64 %25, %28
  %30 = select i1 %27, i1 %29, i1 false
  br i1 %30, label %31, label %40

31:                                               ; preds = %24
  %32 = getelementptr inbounds nuw i64, ptr %22, i64 %25
  %33 = load i64, ptr %32, align 8, !tbaa !59
  %34 = zext i64 %33 to i128
  %35 = add nuw nsw i128 %26, %34
  %36 = trunc i128 %35 to i64
  %37 = getelementptr inbounds nuw i64, ptr %16, i64 %25
  store i64 %36, ptr %37, align 8, !tbaa !59
  %38 = lshr i128 %35, 64
  %39 = add nuw i64 %25, 1
  br label %24, !llvm.loop !88

40:                                               ; preds = %24
  br i1 %4, label %49, label %41

41:                                               ; preds = %40
  %42 = shl nuw nsw i64 %25, 3
  %43 = getelementptr inbounds nuw i8, ptr %22, i64 %42
  %44 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %45 = load i64, ptr %44, align 16, !tbaa !8
  %46 = getelementptr inbounds nuw i64, ptr %16, i64 %25
  %47 = sub nsw i64 %45, %25
  %48 = shl nsw i64 %47, 3
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %46, ptr align 8 %43, i64 %48, i1 false)
  br label %49

49:                                               ; preds = %41, %40
  br i1 %27, label %50, label %62

50:                                               ; preds = %49
  %51 = load i64, ptr %23, align 16, !tbaa !8
  %52 = add i64 %51, 1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %52, i64 noundef %52) #19
  %53 = load i64, ptr %23, align 16, !tbaa !8
  %54 = icmp ugt i64 %53, %51
  br i1 %54, label %55, label %62

55:                                               ; preds = %50
  %56 = trunc nuw i128 %26 to i64
  %57 = load i8, ptr %11, align 1, !tbaa !13, !range !58, !noundef !52
  %58 = trunc nuw i8 %57 to i1
  %59 = load ptr, ptr %14, align 8
  %60 = select i1 %58, ptr %0, ptr %59
  %61 = getelementptr inbounds nuw i64, ptr %60, i64 %51
  store i64 %56, ptr %61, align 8, !tbaa !59
  br label %62

62:                                               ; preds = %50, %55, %49
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE9normalizeEv(ptr noundef nonnull align 16 dereferenceable(27) %0) #18
  %63 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %64 = load i8, ptr %63, align 8, !tbaa !12, !range !58, !noundef !52
  %65 = trunc nuw i8 %64 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %65) #18
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE7do_swapERS6_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1) local_unnamed_addr #1 comdat align 2 {
  %3 = load i128, ptr %0, align 16, !tbaa !6
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %0, ptr noundef nonnull align 16 dereferenceable(16) %1, i64 16, i1 false), !tbaa.struct !89
  store i128 %3, ptr %1, align 16, !tbaa !6
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %5 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %6 = load i8, ptr %4, align 8, !tbaa !90, !range !58, !noundef !52
  %7 = load i8, ptr %5, align 8, !tbaa !90, !range !58, !noundef !52
  store i8 %7, ptr %4, align 8, !tbaa !90
  store i8 %6, ptr %5, align 8, !tbaa !90
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %9 = getelementptr inbounds nuw i8, ptr %1, i64 25
  %10 = load i8, ptr %8, align 1, !tbaa !90, !range !58, !noundef !52
  %11 = load i8, ptr %9, align 1, !tbaa !90, !range !58, !noundef !52
  store i8 %11, ptr %8, align 1, !tbaa !90
  store i8 %10, ptr %9, align 1, !tbaa !90
  %12 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %13 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %14 = load i64, ptr %12, align 16, !tbaa !91
  %15 = load i64, ptr %13, align 16, !tbaa !91
  store i64 %15, ptr %12, align 16, !tbaa !91
  store i64 %14, ptr %13, align 16, !tbaa !91
  %16 = getelementptr inbounds nuw i8, ptr %0, i64 26
  %17 = getelementptr inbounds nuw i8, ptr %1, i64 26
  %18 = load i8, ptr %16, align 2, !tbaa !90, !range !58, !noundef !52
  %19 = load i8, ptr %17, align 2, !tbaa !90, !range !58, !noundef !52
  store i8 %19, ptr %16, align 2, !tbaa !90
  store i8 %18, ptr %17, align 2, !tbaa !90
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6assignERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1) local_unnamed_addr #3 comdat align 2 {
  %3 = icmp eq ptr %0, %1
  br i1 %3, label %25, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store i64 0, ptr %5, align 16, !tbaa !8
  %6 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %7 = load i64, ptr %6, align 16, !tbaa !8
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %7, i64 noundef %7) #19
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %9 = load i8, ptr %8, align 1, !tbaa !13, !range !58, !noundef !52
  %10 = trunc nuw i8 %9 to i1
  %11 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %12 = load ptr, ptr %11, align 8
  %13 = select i1 %10, ptr %0, ptr %12
  %14 = getelementptr inbounds nuw i8, ptr %1, i64 25
  %15 = load i8, ptr %14, align 1, !tbaa !13, !range !58, !noundef !52
  %16 = trunc nuw i8 %15 to i1
  %17 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %18 = load ptr, ptr %17, align 8
  %19 = select i1 %16, ptr %1, ptr %18
  %20 = load i64, ptr %6, align 16, !tbaa !8
  %21 = shl i64 %20, 3
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %19, i64 %21, i1 false)
  %22 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %23 = load i8, ptr %22, align 8, !tbaa !12, !range !58, !noundef !52
  %24 = getelementptr inbounds nuw i8, ptr %0, i64 24
  store i8 %23, ptr %24, align 8, !tbaa !12
  br label %25

25:                                               ; preds = %4, %2
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIxEENSt9enable_ifIXaasr3std7is_sameIT_xEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %1) local_unnamed_addr #1 comdat align 2 {
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef 1, i64 noundef 1) #19
  %3 = tail call noundef i64 @llvm.abs.i64(i64 %1, i1 false)
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %5 = load i8, ptr %4, align 1, !tbaa !13, !range !58, !noundef !52
  %6 = trunc nuw i8 %5 to i1
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %8 = load ptr, ptr %7, align 8
  %9 = select i1 %6, ptr %0, ptr %8
  store i64 %3, ptr %9, align 8, !tbaa !59
  %10 = icmp slt i64 %1, 0
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %10) #18
  ret ptr %0
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1) local_unnamed_addr #1 comdat {
  tail call void @_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_Lm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaaaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT9_EXT10_EXT11_EXT12_ET13_EEEE5valueEvE4typeERS9_RKSB_RKSD_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1) #19
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1) local_unnamed_addr #1 comdat {
  tail call void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_Lm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaaaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT9_EXT10_EXT11_EXT12_ET13_EEEE5valueEvE4typeERS9_RKSB_RKSD_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1) #19
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail6negateES9_vvvEEvRKNSB_10expressionIT_T0_T1_T2_T3_EERKSt17integral_constantIbLb1EE(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #3 comdat align 2 {
  %4 = alloca %"struct.boost::multiprecision::detail::negate", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #22
  call void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_6negateES9_vvvEEEEvRKT_RKSD_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %4) #19
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #22
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_6negateES9_vvvEEEEvRKT_RKSD_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #3 comdat align 2 {
  %4 = alloca %"struct.boost::multiprecision::detail::expression.2", align 8
  %5 = alloca %"struct.boost::multiprecision::detail::terminal", align 1
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #22
  tail call void @llvm.experimental.noalias.scope.decl(metadata !92)
  %6 = load ptr, ptr %1, align 8, !tbaa !95, !noalias !92, !nonnull !52, !align !53
  store ptr %6, ptr %4, align 8, !tbaa !15, !alias.scope !92
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %5) #22
  call void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_8terminalES9_vvvEEEEvRKT_RKSD_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull align 1 dereferenceable(1) %5) #19
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %5) #22
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #22
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6negateEv(ptr noundef nonnull align 16 dereferenceable(27) %0) #18
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EE9do_assignINS0_6detail10expressionINSB_8terminalES9_vvvEEEEvRKT_RKSD_(ptr noundef nonnull align 16 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #3 comdat align 2 {
  %4 = load ptr, ptr %1, align 8, !tbaa !97, !nonnull !52, !align !53
  %5 = icmp eq ptr %4, %0
  br i1 %5, label %7, label %6

6:                                                ; preds = %3
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6assignERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %4) #19
  br label %7

7:                                                ; preds = %6, %3
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
declare dso_local noundef signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv(ptr noundef nonnull align 8 dereferenceable(264)) local_unnamed_addr #3 align 2

; Function Attrs: minsize mustprogress nounwind optsize uwtable
declare dso_local noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEmc(ptr noundef nonnull align 8 dereferenceable(32), i64 noundef, i8 noundef signext) local_unnamed_addr #3 align 2

; Function Attrs: minsize mustprogress nounwind optsize uwtable
declare dso_local noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc(ptr noundef nonnull align 8 dereferenceable(32), i64 noundef, i64 noundef, i8 noundef signext) local_unnamed_addr #3 align 2

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef nonnull align 8 dereferenceable(32)) local_unnamed_addr #1

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE3strB5cxx11ElSt13_Ios_Fmtflags(ptr dead_on_unwind noalias writable sret(%"class.std::__cxx11::basic_string") align 8 %0, ptr noundef nonnull align 16 dereferenceable(27) %1, i64 noundef %2, i32 noundef %3) local_unnamed_addr #3 comdat align 2 {
  %5 = alloca %"struct.std::integral_constant.3", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %5) #22
  call void @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE13do_get_stringB5cxx11ESt13_Ios_FmtflagsRKSt17integral_constantIbLb0EE(ptr dead_on_unwind writable sret(%"class.std::__cxx11::basic_string") align 8 %0, ptr noundef nonnull align 16 dereferenceable(27) %1, i32 noundef %3, ptr noundef nonnull align 1 dereferenceable(1) %5) #19
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %5) #22
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE13do_get_stringB5cxx11ESt13_Ios_FmtflagsRKSt17integral_constantIbLb0EE(ptr dead_on_unwind noalias writable sret(%"class.std::__cxx11::basic_string") align 8 %0, ptr noundef nonnull align 16 dereferenceable(27) %1, i32 noundef %2, ptr noundef nonnull align 1 dereferenceable(1) %3) local_unnamed_addr #3 comdat align 2 {
  %5 = alloca %"class.std::runtime_error", align 8
  %6 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %7 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %8 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %9 = alloca %"class.std::__cxx11::basic_string", align 8
  %10 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %11 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %12 = alloca %"class.std::__cxx11::basic_string", align 8
  %13 = and i32 %2, 64
  %14 = icmp eq i32 %13, 0
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store ptr %15, ptr %0, align 8, !tbaa !99
  %16 = getelementptr inbounds nuw i8, ptr %0, i64 8
  store i64 0, ptr %16, align 8, !tbaa !39
  store i8 0, ptr %15, align 8, !tbaa !6
  %17 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %18 = load i64, ptr %17, align 16, !tbaa !8
  %19 = shl i64 %18, 6
  %20 = and i32 %2, 72
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %96, label %22

22:                                               ; preds = %4
  %23 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %24 = load i8, ptr %23, align 8, !tbaa !12, !range !58, !noundef !52
  %25 = trunc nuw i8 %24 to i1
  br i1 %25, label %26, label %27

26:                                               ; preds = %22
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %5) #22
  call void @_ZNSt13runtime_errorC1EPKc(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef nonnull @.str.10) #18
  call void @_ZN5boost15throw_exceptionERKSt9exceptionRKNS_15source_locationE(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr nonnull align 8 poison) #26
  unreachable

27:                                               ; preds = %22
  %28 = select i1 %14, i32 4, i32 3
  %29 = zext nneg i32 %28 to i64
  %30 = shl nsw i32 -1, %28
  %31 = xor i32 %30, -1
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %6) #22
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EEC2ERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %6, ptr noundef nonnull align 16 dereferenceable(27) %1) #19
  %32 = udiv i64 %19, %29
  %33 = urem i64 %19, %29
  %34 = icmp ne i64 %33, 0
  %35 = zext i1 %34 to i64
  %36 = add nuw nsw i64 %32, %35
  %37 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignEmc(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %36, i8 noundef signext 48) #19
  %38 = load i64, ptr %16, align 8, !tbaa !39
  %39 = icmp ult i64 %38, 9223372036854775807
  call void @llvm.assume(i1 %39)
  %40 = and i32 %2, 16384
  %41 = icmp eq i32 %40, 0
  %42 = getelementptr inbounds nuw i8, ptr %6, i64 25
  %43 = getelementptr inbounds nuw i8, ptr %6, i64 8
  %44 = select i1 %41, i8 87, i8 55
  br label %45

45:                                               ; preds = %51, %27
  %46 = phi i64 [ 0, %27 ], [ %65, %51 ]
  %47 = phi i64 [ %38, %27 ], [ %48, %51 ]
  %48 = add i64 %47, -1
  %49 = icmp ult i64 %46, %32
  br i1 %49, label %51, label %50

50:                                               ; preds = %45
  br i1 %34, label %66, label %80

51:                                               ; preds = %45
  %52 = load i8, ptr %42, align 1, !tbaa !13, !range !58, !noundef !52
  %53 = trunc nuw i8 %52 to i1
  %54 = load ptr, ptr %43, align 8
  %55 = select i1 %53, ptr %6, ptr %54
  %56 = load i64, ptr %55, align 8, !tbaa !59
  %57 = trunc i64 %56 to i32
  %58 = and i32 %57, %31
  %59 = trunc nuw nsw i32 %58 to i8
  %60 = icmp samesign ugt i32 %58, 9
  %61 = select i1 %60, i8 %44, i8 48
  %62 = add nuw nsw i8 %61, %59
  %63 = load ptr, ptr %0, align 8, !tbaa !100
  %64 = getelementptr inbounds nuw i8, ptr %63, i64 %48
  store i8 %62, ptr %64, align 1, !tbaa !6
  call void @_ZN5boost14multiprecision8backends16eval_right_shiftILm0ELm0ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_ELNS0_16cpp_integer_typeE1EXT1_ET2_EEEE5valueEvE4typeERS9_o(ptr noundef nonnull align 16 dereferenceable(27) %6, i64 noundef %29, i64 noundef 0) #19
  %65 = add nuw nsw i64 %46, 1
  br label %45, !llvm.loop !101

66:                                               ; preds = %50
  %67 = load i8, ptr %42, align 1, !tbaa !13, !range !58, !noundef !52
  %68 = trunc nuw i8 %67 to i1
  %69 = load ptr, ptr %43, align 8
  %70 = select i1 %68, ptr %6, ptr %69
  %71 = load i64, ptr %70, align 8, !tbaa !59
  %72 = trunc i64 %71 to i8
  %73 = trunc nuw nsw i64 %33 to i8
  %74 = shl nsw i8 -1, %73
  %75 = xor i8 %74, -1
  %76 = and i8 %72, %75
  %77 = add nuw nsw i8 %76, 48
  %78 = load ptr, ptr %0, align 8, !tbaa !100
  %79 = getelementptr inbounds nuw i8, ptr %78, i64 %48
  store i8 %77, ptr %79, align 1, !tbaa !6
  br label %80

80:                                               ; preds = %66, %50
  %81 = call noundef i64 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE17find_first_not_ofEcm(ptr noundef nonnull align 8 dereferenceable(32) %0, i8 noundef signext 48, i64 noundef 0) #18
  %82 = load i64, ptr %16, align 8, !tbaa !39
  %83 = icmp eq i64 %82, 0
  %84 = icmp ne i64 %81, -1
  %85 = or i1 %84, %83
  %86 = add nsw i64 %82, -1
  %87 = select i1 %85, i64 %81, i64 %86
  %88 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5eraseEmm(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef 0, i64 noundef %87) #19
  %89 = and i32 %2, 512
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %95, label %91

91:                                               ; preds = %80
  %92 = select i1 %41, ptr @.str.14, ptr @.str.13
  %93 = select i1 %14, ptr %92, ptr @.str.12
  %94 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmPKc(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef 0, ptr noundef nonnull %93) #19
  br label %95

95:                                               ; preds = %91, %80
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %6) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %6) #22
  br label %179

96:                                               ; preds = %4
  %97 = udiv i64 %19, 3
  %98 = add nuw nsw i64 %97, 1
  %99 = tail call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignEmc(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %98, i8 noundef signext 48) #19
  %100 = load i64, ptr %16, align 8, !tbaa !39
  %101 = icmp ult i64 %100, 9223372036854775807
  tail call void @llvm.assume(i1 %101)
  %102 = add nsw i64 %100, -1
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %7) #22
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EEC2ERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %7, ptr noundef nonnull align 16 dereferenceable(27) %1) #19
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #22
  store i64 0, ptr %8, align 16, !tbaa !6
  %103 = getelementptr inbounds nuw i8, ptr %8, i64 16
  store i64 1, ptr %103, align 16, !tbaa !8
  %104 = getelementptr inbounds nuw i8, ptr %8, i64 24
  store i8 0, ptr %104, align 8, !tbaa !12
  %105 = getelementptr inbounds nuw i8, ptr %8, i64 25
  store i8 1, ptr %105, align 1, !tbaa !13
  %106 = getelementptr inbounds nuw i8, ptr %8, i64 26
  store i8 0, ptr %106, align 2, !tbaa !14
  %107 = getelementptr inbounds nuw i8, ptr %7, i64 24
  %108 = load i8, ptr %107, align 8, !tbaa !12, !range !58, !noundef !52
  %109 = trunc nuw i8 %108 to i1
  br i1 %109, label %110, label %111

110:                                              ; preds = %96
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6negateEv(ptr noundef nonnull align 16 dereferenceable(27) %7) #18
  br label %111

111:                                              ; preds = %110, %96
  %112 = load i64, ptr %17, align 16, !tbaa !8
  %113 = icmp eq i64 %112, 1
  br i1 %113, label %114, label %123

114:                                              ; preds = %111
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %9) #22
  %115 = getelementptr inbounds nuw i8, ptr %7, i64 25
  %116 = load i8, ptr %115, align 1, !tbaa !13, !range !58, !noundef !52
  %117 = trunc nuw i8 %116 to i1
  %118 = getelementptr inbounds nuw i8, ptr %7, i64 8
  %119 = load ptr, ptr %118, align 8
  %120 = select i1 %117, ptr %7, ptr %119
  %121 = load i64, ptr %120, align 8, !tbaa !59
  call void @_ZNSt7__cxx119to_stringEy(ptr dead_on_unwind nonnull writable sret(%"class.std::__cxx11::basic_string") align 8 %9, i64 noundef %121) #19
  %122 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(32) %9) #18
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv(ptr noundef nonnull align 8 dereferenceable(32) %9) #19
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %9) #22
  br label %163

123:                                              ; preds = %111
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %10) #22
  store i64 0, ptr %10, align 16, !tbaa !6
  %124 = getelementptr inbounds nuw i8, ptr %10, i64 16
  store i64 1, ptr %124, align 16, !tbaa !8
  %125 = getelementptr inbounds nuw i8, ptr %10, i64 24
  store i8 0, ptr %125, align 8, !tbaa !12
  %126 = getelementptr inbounds nuw i8, ptr %10, i64 25
  store i8 1, ptr %126, align 1, !tbaa !13
  %127 = getelementptr inbounds nuw i8, ptr %10, i64 26
  store i8 0, ptr %127, align 2, !tbaa !14
  %128 = call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %10, i64 noundef 1000000000000000000) #18
  %129 = getelementptr inbounds nuw i8, ptr %11, i64 16
  %130 = getelementptr inbounds nuw i8, ptr %11, i64 24
  %131 = getelementptr inbounds nuw i8, ptr %11, i64 25
  %132 = getelementptr inbounds nuw i8, ptr %11, i64 26
  %133 = getelementptr inbounds nuw i8, ptr %8, i64 8
  br label %134

134:                                              ; preds = %160, %123
  %135 = phi i64 [ %102, %123 ], [ %161, %160 ]
  %136 = call noundef i32 @_ZN5boost14multiprecision8backends13eval_get_signILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEiE4typeERKS9_(ptr noundef nonnull align 16 dereferenceable(27) %7) #18
  %137 = icmp eq i32 %136, 0
  br i1 %137, label %162, label %138

138:                                              ; preds = %134
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %11) #22
  store i64 0, ptr %11, align 16, !tbaa !6
  store i64 1, ptr %129, align 16, !tbaa !8
  store i8 0, ptr %130, align 8, !tbaa !12
  store i8 1, ptr %131, align 1, !tbaa !13
  store i8 0, ptr %132, align 2, !tbaa !14
  call void @_ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvPT_RKT0_RKT1_RS8_(ptr noundef nonnull %11, ptr noundef nonnull align 16 dereferenceable(27) %7, ptr noundef nonnull align 16 dereferenceable(27) %10, ptr noundef nonnull align 16 dereferenceable(27) %8) #19
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6assignERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %7, ptr noundef nonnull align 16 dereferenceable(27) %11) #19
  %139 = load i8, ptr %105, align 1, !tbaa !13, !range !58, !noundef !52
  %140 = trunc nuw i8 %139 to i1
  %141 = load ptr, ptr %133, align 8
  %142 = select i1 %140, ptr %8, ptr %141
  %143 = load i64, ptr %142, align 8, !tbaa !59
  br label %144

144:                                              ; preds = %157, %138
  %145 = phi i64 [ %135, %138 ], [ %158, %157 ]
  %146 = phi i64 [ %143, %138 ], [ %151, %157 ]
  %147 = phi i64 [ 0, %138 ], [ %159, %157 ]
  %148 = icmp eq i64 %147, 18
  br i1 %148, label %160, label %149

149:                                              ; preds = %144
  %150 = urem i64 %146, 10
  %151 = udiv i64 %146, 10
  %152 = trunc nuw nsw i64 %150 to i8
  %153 = or disjoint i8 %152, 48
  %154 = load ptr, ptr %0, align 8, !tbaa !100
  %155 = getelementptr inbounds nuw i8, ptr %154, i64 %145
  store i8 %153, ptr %155, align 1, !tbaa !6
  %156 = icmp eq i64 %145, 0
  br i1 %156, label %160, label %157

157:                                              ; preds = %149
  %158 = add nsw i64 %145, -1
  %159 = add nuw nsw i64 %147, 1
  br label %144, !llvm.loop !102

160:                                              ; preds = %144, %149
  %161 = phi i64 [ -1, %149 ], [ %145, %144 ]
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %11) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %11) #22
  br label %134, !llvm.loop !103

162:                                              ; preds = %134
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %10) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %10) #22
  br label %163

163:                                              ; preds = %162, %114
  %164 = call noundef i64 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE17find_first_not_ofEcm(ptr noundef nonnull align 8 dereferenceable(32) %0, i8 noundef signext 48, i64 noundef 0) #18
  %165 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5eraseEmm(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef 0, i64 noundef %164) #19
  %166 = load i64, ptr %16, align 8, !tbaa !39
  %167 = icmp eq i64 %166, 0
  br i1 %167, label %168, label %171

168:                                              ; preds = %163
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %12) #22
  %169 = getelementptr inbounds nuw i8, ptr %12, i64 16
  store ptr %169, ptr %12, align 8, !tbaa !99
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEmc(ptr noundef nonnull align 8 dereferenceable(32) %12, i64 noundef 1, i8 noundef signext 48) #18
  %170 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(32) %12) #18
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv(ptr noundef nonnull align 8 dereferenceable(32) %12) #19
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %12) #22
  br label %171

171:                                              ; preds = %168, %163
  br i1 %109, label %175, label %172

172:                                              ; preds = %171
  %173 = and i32 %2, 2048
  %174 = icmp eq i32 %173, 0
  br i1 %174, label %178, label %175

175:                                              ; preds = %172, %171
  %176 = phi i8 [ 45, %171 ], [ 43, %172 ]
  %177 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef 0, i64 noundef 1, i8 noundef signext %176) #19
  br label %178

178:                                              ; preds = %175, %172
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %8) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #22
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %7) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %7) #22
  br label %179

179:                                              ; preds = %95, %178
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
declare dso_local noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignEmc(ptr noundef nonnull align 8 dereferenceable(32), i64 noundef, i8 noundef signext) local_unnamed_addr #3 align 2

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends16eval_right_shiftILm0ELm0ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_ELNS0_16cpp_integer_typeE1EXT1_ET2_EEEE5valueEvE4typeERS9_o(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #1 comdat {
  %4 = or i64 %2, %1
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %18, label %6

6:                                                ; preds = %3
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %8 = load i8, ptr %7, align 8, !tbaa !12, !range !58, !noundef !52
  %9 = trunc nuw i8 %8 to i1
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  tail call void @_ZN5boost14multiprecision8backends14eval_incrementILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_(ptr noundef nonnull align 16 dereferenceable(27) %0) #19
  br label %11

11:                                               ; preds = %10, %6
  %12 = and i64 %1, 7
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  tail call void @_ZN5boost14multiprecision8backends16right_shift_byteINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEEvRT_o(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %1, i64 noundef %2) #19
  br label %16

15:                                               ; preds = %11
  tail call void @_ZN5boost14multiprecision8backends19right_shift_genericINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEEvRT_o(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %1, i64 noundef %2) #19
  br label %16

16:                                               ; preds = %15, %14
  br i1 %9, label %17, label %18

17:                                               ; preds = %16
  tail call void @_ZN5boost14multiprecision8backends14eval_decrementILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_(ptr noundef nonnull align 16 dereferenceable(27) %0) #19
  br label %18

18:                                               ; preds = %16, %17, %3
  ret void
}

; Function Attrs: minsize nounwind optsize
declare dso_local noundef i64 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE17find_first_not_ofEcm(ptr noundef nonnull align 8 dereferenceable(32), i8 noundef signext, i64 noundef) local_unnamed_addr #14

; Function Attrs: minsize mustprogress nounwind optsize uwtable
declare dso_local noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5eraseEmm(ptr noundef nonnull align 8 dereferenceable(32), i64 noundef, i64 noundef) local_unnamed_addr #3 align 2

; Function Attrs: minsize mustprogress nounwind optsize uwtable
declare dso_local noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmPKc(ptr noundef nonnull align 8 dereferenceable(32), i64 noundef, ptr noundef) local_unnamed_addr #3 align 2

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZNSt7__cxx119to_stringEy(ptr dead_on_unwind noalias writable sret(%"class.std::__cxx11::basic_string") align 8 %0, i64 noundef %1) local_unnamed_addr #1 comdat {
  %3 = tail call noundef i32 @_ZNSt8__detail14__to_chars_lenIyEEjT_i(i64 noundef %1, i32 noundef 10) #18
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store ptr %4, ptr %0, align 8, !tbaa !99
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8
  store i64 0, ptr %5, align 8, !tbaa !39
  store i8 0, ptr %4, align 8, !tbaa !6
  %6 = zext i32 %3 to i64
  tail call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE22__resize_and_overwriteIZNS_9to_stringEyEUlPcmE_EEvmT_(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %6, i64 %1) #19
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
declare dso_local noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_(ptr noundef nonnull align 8 dereferenceable(32), ptr noundef nonnull align 8 dereferenceable(32)) local_unnamed_addr #3 align 2

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef i32 @_ZN5boost14multiprecision8backends13eval_get_signILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEiE4typeERKS9_(ptr noundef nonnull align 16 dereferenceable(27) %0) local_unnamed_addr #1 comdat {
  %2 = tail call noundef zeroext i1 @_ZN5boost14multiprecision8backends12eval_is_zeroILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEbE4typeERKS9_(ptr noundef nonnull align 16 dereferenceable(27) %0) #18
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %4 = load i8, ptr %3, align 8, !range !58
  %5 = trunc nuw i8 %4 to i1
  %6 = select i1 %5, i32 -1, i32 1
  %7 = select i1 %2, i32 0, i32 %6
  ret i32 %7
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvPT_RKT0_RKT1_RS8_(ptr noundef %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %2, ptr noundef nonnull align 16 dereferenceable(27) %3) local_unnamed_addr #3 comdat {
  %5 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %6 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %7 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %8 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %9 = icmp eq ptr %0, %1
  %10 = icmp eq ptr %3, %1
  %11 = or i1 %9, %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %4
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %5) #22
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EEC2ERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %5, ptr noundef nonnull align 16 dereferenceable(27) %1) #19
  call void @_ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvPT_RKT0_RKT1_RS8_(ptr noundef %0, ptr noundef nonnull align 16 dereferenceable(27) %5, ptr noundef nonnull align 16 dereferenceable(27) %2, ptr noundef nonnull align 16 dereferenceable(27) %3) #19
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %5) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %5) #22
  br label %362

13:                                               ; preds = %4
  %14 = icmp eq ptr %0, %2
  %15 = icmp eq ptr %3, %2
  %16 = or i1 %14, %15
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %6) #22
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EEC2ERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %6, ptr noundef nonnull align 16 dereferenceable(27) %2) #19
  call void @_ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvPT_RKT0_RKT1_RS8_(ptr noundef %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %6, ptr noundef nonnull align 16 dereferenceable(27) %3) #19
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %6) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %6) #22
  br label %362

18:                                               ; preds = %13
  %19 = icmp eq ptr %0, %3
  br i1 %19, label %20, label %25

20:                                               ; preds = %18
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %7) #22
  store i64 0, ptr %7, align 16, !tbaa !6
  %21 = getelementptr inbounds nuw i8, ptr %7, i64 16
  store i64 1, ptr %21, align 16, !tbaa !8
  %22 = getelementptr inbounds nuw i8, ptr %7, i64 24
  store i8 0, ptr %22, align 8, !tbaa !12
  %23 = getelementptr inbounds nuw i8, ptr %7, i64 25
  store i8 1, ptr %23, align 1, !tbaa !13
  %24 = getelementptr inbounds nuw i8, ptr %7, i64 26
  store i8 0, ptr %24, align 2, !tbaa !14
  call void @_ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvPT_RKT0_RKT1_RS8_(ptr noundef %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 16 dereferenceable(27) %2, ptr noundef nonnull align 16 dereferenceable(27) %7) #19
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6assignERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %7) #19
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %7) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %7) #22
  br label %362

25:                                               ; preds = %18
  %26 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %27 = load i64, ptr %26, align 16, !tbaa !8
  %28 = add i64 %27, -1
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %30, label %38

30:                                               ; preds = %25
  %31 = getelementptr inbounds nuw i8, ptr %2, i64 25
  %32 = load i8, ptr %31, align 1, !tbaa !13, !range !58, !noundef !52
  %33 = trunc nuw i8 %32 to i1
  %34 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %35 = load ptr, ptr %34, align 8
  %36 = select i1 %33, ptr %2, ptr %35
  %37 = load i64, ptr %36, align 8, !tbaa !59
  tail call void @_ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvPT_RKT0_yRS8_(ptr noundef %0, ptr noundef nonnull align 16 dereferenceable(27) %1, i64 noundef %37, ptr noundef nonnull align 16 dereferenceable(27) %3) #19
  br label %362

38:                                               ; preds = %25
  %39 = getelementptr inbounds nuw i8, ptr %1, i64 25
  %40 = load i8, ptr %39, align 1, !tbaa !13, !range !58, !noundef !52
  %41 = trunc nuw i8 %40 to i1
  %42 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %43 = load ptr, ptr %42, align 8
  %44 = select i1 %41, ptr %1, ptr %43
  %45 = getelementptr inbounds nuw i8, ptr %2, i64 25
  %46 = load i8, ptr %45, align 1, !tbaa !13, !range !58, !noundef !52
  %47 = trunc nuw i8 %46 to i1
  %48 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %49 = load ptr, ptr %48, align 8
  %50 = select i1 %47, ptr %2, ptr %49
  %51 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %52 = load i64, ptr %51, align 16, !tbaa !8
  %53 = add i64 %52, -1
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %55, label %61

55:                                               ; preds = %38
  %56 = load i64, ptr %44, align 8, !tbaa !59
  %57 = icmp eq i64 %56, 0
  br i1 %57, label %58, label %61

58:                                               ; preds = %55
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6assignERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %1) #19
  %59 = icmp eq ptr %0, null
  br i1 %59, label %362, label %60

60:                                               ; preds = %58
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6assignERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1) #19
  br label %362

61:                                               ; preds = %55, %38
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6assignERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %1) #19
  %62 = getelementptr inbounds nuw i8, ptr %3, i64 24
  store i8 0, ptr %62, align 8, !tbaa !12
  %63 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %64 = icmp ne ptr %0, null
  br i1 %64, label %65, label %67

65:                                               ; preds = %61
  %66 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef 0) #18
  br label %67

67:                                               ; preds = %65, %61
  %68 = icmp ugt i64 %53, %28
  br i1 %68, label %74, label %69

69:                                               ; preds = %67
  %70 = icmp ult i64 %53, %28
  br i1 %70, label %362, label %71

71:                                               ; preds = %69
  %72 = tail call noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE16compare_unsignedILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EE(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %2) #18
  %73 = icmp slt i32 %72, 0
  br i1 %73, label %362, label %74

74:                                               ; preds = %67, %71
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #22
  store i64 0, ptr %8, align 16, !tbaa !6
  %75 = getelementptr inbounds nuw i8, ptr %8, i64 16
  store i64 1, ptr %75, align 16, !tbaa !8
  %76 = getelementptr inbounds nuw i8, ptr %8, i64 24
  store i8 0, ptr %76, align 8, !tbaa !12
  %77 = getelementptr inbounds nuw i8, ptr %8, i64 25
  store i8 1, ptr %77, align 1, !tbaa !13
  %78 = getelementptr inbounds nuw i8, ptr %8, i64 26
  store i8 0, ptr %78, align 2, !tbaa !14
  %79 = icmp eq i64 %53, 1
  br i1 %79, label %80, label %107

80:                                               ; preds = %74
  %81 = getelementptr inbounds nuw i8, ptr %44, i64 8
  %82 = load i64, ptr %81, align 8, !tbaa !59
  %83 = zext i64 %82 to i128
  %84 = shl nuw i128 %83, 64
  %85 = load i64, ptr %44, align 8, !tbaa !59
  %86 = zext i64 %85 to i128
  %87 = or disjoint i128 %84, %86
  %88 = getelementptr inbounds nuw i8, ptr %50, i64 8
  %89 = load i64, ptr %88, align 8, !tbaa !59
  %90 = zext i64 %89 to i128
  %91 = shl nuw i128 %90, 64
  %92 = load i64, ptr %50, align 8, !tbaa !59
  %93 = zext i64 %92 to i128
  %94 = or disjoint i128 %91, %93
  br i1 %64, label %95, label %101

95:                                               ; preds = %80
  %96 = udiv i128 %87, %94
  %97 = trunc i128 %96 to i64
  %98 = lshr i128 %96, 64
  %99 = trunc nuw i128 %98 to i64
  %100 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIoEENSt9enable_ifIXaasr3std7is_sameIT_oEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %97, i64 noundef %99) #18
  br label %101

101:                                              ; preds = %95, %80
  %102 = urem i128 %87, %94
  %103 = trunc i128 %102 to i64
  %104 = lshr i128 %102, 64
  %105 = trunc nuw i128 %104 to i64
  %106 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIoEENSt9enable_ifIXaasr3std7is_sameIT_oEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %3, i64 noundef %103, i64 noundef %105) #18
  br label %361

107:                                              ; preds = %74
  br i1 %64, label %115, label %108

108:                                              ; preds = %107
  %109 = getelementptr inbounds nuw i8, ptr %3, i64 25
  %110 = load i8, ptr %109, align 1, !tbaa !13, !range !58, !noundef !52
  %111 = trunc nuw i8 %110 to i1
  %112 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %113 = load ptr, ptr %112, align 8
  %114 = select i1 %111, ptr %3, ptr %113
  br label %136

115:                                              ; preds = %107
  %116 = sub i64 %52, %28
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %116, i64 noundef %116) #19
  %117 = getelementptr inbounds nuw i8, ptr %3, i64 25
  %118 = load i8, ptr %117, align 1, !tbaa !13, !range !58, !noundef !52
  %119 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %120 = load ptr, ptr %119, align 8
  %121 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %122 = load i8, ptr %121, align 1, !tbaa !13, !range !58, !noundef !52
  %123 = trunc nuw i8 %122 to i1
  %124 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %125 = load ptr, ptr %124, align 8
  %126 = select i1 %123, ptr %0, ptr %125
  br label %127

127:                                              ; preds = %130, %115
  %128 = phi i64 [ 1, %115 ], [ %132, %130 ]
  %129 = icmp ult i64 %128, %116
  br i1 %129, label %130, label %133

130:                                              ; preds = %127
  %131 = getelementptr inbounds nuw i64, ptr %126, i64 %128
  store i64 0, ptr %131, align 8, !tbaa !59
  %132 = add nuw i64 %128, 1
  br label %127, !llvm.loop !104

133:                                              ; preds = %127
  %134 = trunc nuw i8 %118 to i1
  %135 = select i1 %134, ptr %3, ptr %120
  br label %136

136:                                              ; preds = %133, %108
  %137 = phi ptr [ %114, %108 ], [ %135, %133 ]
  %138 = phi ptr [ %112, %108 ], [ %119, %133 ]
  %139 = phi ptr [ %109, %108 ], [ %117, %133 ]
  %140 = phi ptr [ null, %108 ], [ %126, %133 ]
  %141 = getelementptr inbounds nuw i64, ptr %50, i64 %28
  %142 = getelementptr i64, ptr %50, i64 %27
  %143 = getelementptr i8, ptr %142, i64 -16
  %144 = getelementptr inbounds nuw i8, ptr %8, i64 8
  %145 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %146 = getelementptr i8, ptr %140, i64 -8
  br label %147

147:                                              ; preds = %343, %136
  %148 = phi i1 [ true, %136 ], [ %334, %343 ]
  %149 = phi ptr [ %137, %136 ], [ %323, %343 ]
  %150 = phi i8 [ 0, %136 ], [ %324, %343 ]
  %151 = phi i64 [ %53, %136 ], [ %336, %343 ]
  %152 = getelementptr inbounds nuw i64, ptr %149, i64 %151
  %153 = load i64, ptr %152, align 8, !tbaa !59
  %154 = load i64, ptr %141, align 8, !tbaa !59
  %155 = icmp ule i64 %153, %154
  %156 = icmp ne i64 %151, 0
  %157 = and i1 %156, %155
  br i1 %157, label %158, label %170

158:                                              ; preds = %147
  %159 = zext i64 %153 to i128
  %160 = shl nuw i128 %159, 64
  %161 = getelementptr i8, ptr %152, i64 -8
  %162 = load i64, ptr %161, align 8, !tbaa !59
  %163 = zext i64 %162 to i128
  %164 = or disjoint i128 %160, %163
  %165 = zext i64 %154 to i128
  %166 = udiv i128 %164, %165
  %167 = icmp ult i128 %166, 18446744073709551616
  %168 = trunc nuw i128 %166 to i64
  %169 = add i64 %151, -1
  br i1 %167, label %192, label %197

170:                                              ; preds = %147
  %171 = icmp eq i64 %151, 0
  br i1 %171, label %172, label %175

172:                                              ; preds = %170
  %173 = load i64, ptr %149, align 8, !tbaa !59
  %174 = udiv i64 %173, %154
  br label %192

175:                                              ; preds = %170
  %176 = zext i64 %154 to i128
  %177 = shl nuw i128 %176, 64
  %178 = load i64, ptr %143, align 8, !tbaa !59
  %179 = zext i64 %178 to i128
  %180 = or disjoint i128 %177, %179
  %181 = icmp eq i128 %180, 0
  br i1 %181, label %182, label %183

182:                                              ; preds = %175
  call void @__assert_fail(ptr noundef nonnull @.str.21, ptr noundef nonnull @.str.22, i32 noundef 178, ptr noundef nonnull @__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvPT_RKT0_RKT1_RS8_) #20
  unreachable

183:                                              ; preds = %175
  %184 = zext i64 %153 to i128
  %185 = shl nuw i128 %184, 64
  %186 = getelementptr i8, ptr %152, i64 -8
  %187 = load i64, ptr %186, align 8, !tbaa !59
  %188 = zext i64 %187 to i128
  %189 = or disjoint i128 %185, %188
  %190 = udiv i128 %189, %180
  %191 = trunc i128 %190 to i64
  br label %192

192:                                              ; preds = %158, %172, %183
  %193 = phi i64 [ %174, %172 ], [ %191, %183 ], [ %168, %158 ]
  %194 = phi i64 [ 0, %172 ], [ %151, %183 ], [ %169, %158 ]
  %195 = icmp eq i64 %193, 0
  br i1 %195, label %196, label %197

196:                                              ; preds = %192
  call void @__assert_fail(ptr noundef nonnull @.str.23, ptr noundef nonnull @.str.22, i32 noundef 182, ptr noundef nonnull @__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvPT_RKT0_RKT1_RS8_) #20
  unreachable

197:                                              ; preds = %158, %192
  %198 = phi i64 [ %194, %192 ], [ %151, %158 ]
  %199 = phi i64 [ %193, %192 ], [ 1, %158 ]
  %200 = sub i64 %198, %28
  br i1 %64, label %201, label %246

201:                                              ; preds = %197
  %202 = trunc nuw i8 %150 to i1
  %203 = getelementptr inbounds nuw i64, ptr %140, i64 %200
  %204 = load i64, ptr %203, align 8, !tbaa !59
  br i1 %202, label %205, label %225

205:                                              ; preds = %201
  %206 = icmp ugt i64 %204, %199
  br i1 %206, label %207, label %209

207:                                              ; preds = %205
  %208 = sub nuw i64 %204, %199
  store i64 %208, ptr %203, align 8, !tbaa !59
  br label %246

209:                                              ; preds = %205
  %210 = add i64 %200, 1
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %8, i64 noundef %210, i64 noundef %210) #19
  %211 = load i8, ptr %77, align 1, !tbaa !13, !range !58, !noundef !52
  %212 = trunc nuw i8 %211 to i1
  %213 = load ptr, ptr %144, align 8
  %214 = select i1 %212, ptr %8, ptr %213
  %215 = getelementptr inbounds nuw i64, ptr %214, i64 %200
  store i64 %199, ptr %215, align 8, !tbaa !59
  br label %216

216:                                              ; preds = %220, %209
  %217 = phi i64 [ 0, %209 ], [ %224, %220 ]
  %218 = icmp eq i64 %217, %200
  br i1 %218, label %219, label %220

219:                                              ; preds = %216
  call void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %8) #19
  br label %246

220:                                              ; preds = %216
  %221 = load ptr, ptr %144, align 8
  %222 = select i1 %212, ptr %8, ptr %221
  %223 = getelementptr inbounds nuw i64, ptr %222, i64 %217
  store i64 0, ptr %223, align 8, !tbaa !59
  %224 = add i64 %217, 1
  br label %216, !llvm.loop !105

225:                                              ; preds = %201
  %226 = xor i64 %204, -1
  %227 = icmp ult i64 %199, %226
  br i1 %227, label %228, label %230

228:                                              ; preds = %225
  %229 = add i64 %204, %199
  store i64 %229, ptr %203, align 8, !tbaa !59
  br label %246

230:                                              ; preds = %225
  %231 = add i64 %200, 1
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %8, i64 noundef %231, i64 noundef %231) #19
  %232 = load i8, ptr %77, align 1, !tbaa !13, !range !58, !noundef !52
  %233 = trunc nuw i8 %232 to i1
  %234 = load ptr, ptr %144, align 8
  %235 = select i1 %233, ptr %8, ptr %234
  %236 = getelementptr inbounds nuw i64, ptr %235, i64 %200
  store i64 %199, ptr %236, align 8, !tbaa !59
  br label %237

237:                                              ; preds = %241, %230
  %238 = phi i64 [ 0, %230 ], [ %245, %241 ]
  %239 = icmp eq i64 %238, %200
  br i1 %239, label %240, label %241

240:                                              ; preds = %237
  call void @_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %8) #19
  br label %246

241:                                              ; preds = %237
  %242 = load ptr, ptr %144, align 8
  %243 = select i1 %233, ptr %8, ptr %242
  %244 = getelementptr inbounds nuw i64, ptr %243, i64 %238
  store i64 0, ptr %244, align 8, !tbaa !59
  %245 = add i64 %238, 1
  br label %237, !llvm.loop !106

246:                                              ; preds = %219, %207, %240, %228, %197
  %247 = load i64, ptr %26, align 16, !tbaa !8
  %248 = add i64 %247, %200
  %249 = add i64 %248, 1
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %8, i64 noundef %249, i64 noundef %248) #19
  %250 = load i64, ptr %75, align 16, !tbaa !8
  %251 = load i64, ptr %26, align 16, !tbaa !8
  %252 = load i8, ptr %77, align 1, !tbaa !13, !range !58, !noundef !52
  %253 = trunc nuw i8 %252 to i1
  %254 = load ptr, ptr %144, align 8
  %255 = select i1 %253, ptr %8, ptr %254
  br label %256

256:                                              ; preds = %262, %246
  %257 = phi i64 [ 0, %246 ], [ %264, %262 ]
  %258 = icmp eq i64 %257, %200
  br i1 %258, label %259, label %262

259:                                              ; preds = %256
  %260 = getelementptr i64, ptr %255, i64 %200
  %261 = zext i64 %199 to i128
  br label %265

262:                                              ; preds = %256
  %263 = getelementptr inbounds nuw i64, ptr %255, i64 %257
  store i64 0, ptr %263, align 8, !tbaa !59
  %264 = add i64 %257, 1
  br label %256, !llvm.loop !107

265:                                              ; preds = %259, %275
  %266 = phi i128 [ %283, %275 ], [ 0, %259 ]
  %267 = phi i64 [ %284, %275 ], [ 0, %259 ]
  %268 = icmp eq i64 %267, %251
  br i1 %268, label %269, label %275

269:                                              ; preds = %265
  %270 = add i64 %200, 1
  %271 = add i64 %270, %251
  %272 = icmp ne i64 %250, %271
  %273 = icmp eq i128 %266, 0
  %274 = or i1 %272, %273
  br i1 %274, label %289, label %285

275:                                              ; preds = %265
  %276 = getelementptr inbounds nuw i64, ptr %50, i64 %267
  %277 = load i64, ptr %276, align 8, !tbaa !59
  %278 = zext i64 %277 to i128
  %279 = mul nuw i128 %278, %261
  %280 = add nuw i128 %279, %266
  %281 = trunc i128 %280 to i64
  %282 = getelementptr i64, ptr %260, i64 %267
  store i64 %281, ptr %282, align 8, !tbaa !59
  %283 = lshr i128 %280, 64
  %284 = add i64 %267, 1
  br label %265, !llvm.loop !108

285:                                              ; preds = %269
  %286 = trunc nuw i128 %266 to i64
  %287 = getelementptr i64, ptr %255, i64 %250
  %288 = getelementptr i8, ptr %287, i64 -8
  store i64 %286, ptr %288, align 8, !tbaa !59
  br label %292

289:                                              ; preds = %269
  br i1 %272, label %292, label %290

290:                                              ; preds = %289
  %291 = add i64 %250, -1
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %8, i64 noundef %291, i64 noundef %291) #19
  br label %312

292:                                              ; preds = %289, %285
  %293 = icmp ne i128 %266, 0
  %294 = select i1 %272, i1 %293, i1 false
  br i1 %294, label %295, label %312

295:                                              ; preds = %292
  %296 = load i8, ptr %139, align 1, !tbaa !13, !range !58, !noundef !52
  %297 = trunc nuw i8 %296 to i1
  %298 = add i64 %198, 1
  br label %299

299:                                              ; preds = %295, %304
  %300 = phi i64 [ %311, %304 ], [ 0, %295 ]
  %301 = icmp eq i64 %300, %298
  br i1 %301, label %302, label %304

302:                                              ; preds = %299
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE9normalizeEv(ptr noundef nonnull align 16 dereferenceable(27) %3) #18
  call void @_ZN5boost14multiprecision8backends14eval_incrementILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_(ptr noundef nonnull align 16 dereferenceable(27) %3) #19
  call void @_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %8) #19
  %303 = xor i8 %150, 1
  br label %322

304:                                              ; preds = %299
  %305 = getelementptr inbounds nuw i64, ptr %149, i64 %300
  %306 = load i64, ptr %305, align 8, !tbaa !59
  %307 = xor i64 %306, -1
  %308 = load ptr, ptr %138, align 8
  %309 = select i1 %297, ptr %3, ptr %308
  %310 = getelementptr inbounds nuw i64, ptr %309, i64 %300
  store i64 %307, ptr %310, align 8, !tbaa !59
  %311 = add i64 %300, 1
  br label %299, !llvm.loop !109

312:                                              ; preds = %290, %292
  %313 = call noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE7compareILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EE(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %8) #18
  %314 = icmp sgt i32 %313, 0
  br i1 %314, label %315, label %316

315:                                              ; preds = %312
  call void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %8) #19
  br label %322

316:                                              ; preds = %312
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE7do_swapERS6_(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %8) #18
  call void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %8) #19
  %317 = load i8, ptr %139, align 1, !tbaa !13, !range !58, !noundef !52
  %318 = trunc nuw i8 %317 to i1
  %319 = load ptr, ptr %138, align 8
  %320 = select i1 %318, ptr %3, ptr %319
  %321 = xor i8 %150, 1
  br label %322

322:                                              ; preds = %315, %316, %302
  %323 = phi ptr [ %149, %302 ], [ %149, %315 ], [ %320, %316 ]
  %324 = phi i8 [ %303, %302 ], [ %150, %315 ], [ %321, %316 ]
  %325 = select i1 %64, i1 %148, i1 false
  br i1 %325, label %326, label %333

326:                                              ; preds = %322, %331
  %327 = load i64, ptr %145, align 16, !tbaa !8
  %328 = getelementptr i64, ptr %146, i64 %327
  %329 = load i64, ptr %328, align 8, !tbaa !59
  %330 = icmp eq i64 %329, 0
  br i1 %330, label %331, label %333

331:                                              ; preds = %326
  %332 = add i64 %327, -1
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %332, i64 noundef %332) #19
  br label %326, !llvm.loop !110

333:                                              ; preds = %326, %322
  %334 = phi i1 [ %148, %322 ], [ false, %326 ]
  %335 = load i64, ptr %63, align 16, !tbaa !8
  %336 = add i64 %335, -1
  %337 = icmp ult i64 %336, %28
  br i1 %337, label %344, label %338

338:                                              ; preds = %333
  %339 = icmp ugt i64 %336, %28
  br i1 %339, label %343, label %340

340:                                              ; preds = %338
  %341 = call noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE16compare_unsignedILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EE(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %2) #18
  %342 = icmp sgt i32 %341, -1
  br i1 %342, label %343, label %344

343:                                              ; preds = %340, %338
  br label %147, !llvm.loop !111

344:                                              ; preds = %333, %340
  %345 = trunc nuw i8 %324 to i1
  br i1 %345, label %346, label %357

346:                                              ; preds = %344
  %347 = call noundef i32 @_ZN5boost14multiprecision8backends13eval_get_signILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEiE4typeERKS9_(ptr noundef nonnull align 16 dereferenceable(27) %3) #18
  %348 = icmp eq i32 %347, 0
  br i1 %348, label %357, label %349

349:                                              ; preds = %346
  br i1 %64, label %350, label %351

350:                                              ; preds = %349
  call void @_ZN5boost14multiprecision8backends14eval_decrementILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_(ptr noundef nonnull align 16 dereferenceable(27) %0) #19
  br label %351

351:                                              ; preds = %350, %349
  %352 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %353 = load i8, ptr %352, align 8, !tbaa !12, !range !58, !noundef !52
  %354 = trunc nuw i8 %353 to i1
  br i1 %354, label %355, label %356

355:                                              ; preds = %351
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6negateEv(ptr noundef nonnull align 16 dereferenceable(27) %3) #18
  call void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valueEvE4typeERS9_RKSB_(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %2) #19
  br label %357

356:                                              ; preds = %351
  call void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELm0ELm0ELS3_1ELS4_0ES5_Lm0ELm0ELS3_1ELS4_0ES5_EENSt9enable_ifIXaaaantsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT4_EXT5_EXT6_EXT7_ET8_EEEE5valuentsr18is_trivial_cpp_intINS7_IXT9_EXT10_EXT11_EXT12_ET13_EEEE5valueEvE4typeERS9_RKSB_RKSD_(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %2, ptr noundef nonnull align 16 dereferenceable(27) %3) #19
  br label %357

357:                                              ; preds = %355, %356, %346, %344
  %358 = call noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE16compare_unsignedILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EE(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %2) #18
  %359 = icmp slt i32 %358, 0
  br i1 %359, label %361, label %360

360:                                              ; preds = %357
  call void @__assert_fail(ptr noundef nonnull @.str.24, ptr noundef nonnull @.str.22, i32 noundef 312, ptr noundef nonnull @__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_S7_EEvPT_RKT0_RKT1_RS8_) #20
  unreachable

361:                                              ; preds = %357, %101
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %8) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #22
  br label %362

362:                                              ; preds = %30, %69, %71, %58, %60, %361, %12, %17, %20
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EEC2ERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1) unnamed_addr #1 comdat align 2 {
  store i64 0, ptr %0, align 16, !tbaa !6
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 26
  %5 = load i8, ptr %4, align 2, !tbaa !14, !range !58, !noundef !52
  %6 = trunc nuw i8 %5 to i1
  %7 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %8 = load i64, ptr %7, align 16
  %9 = select i1 %6, i64 %8, i64 0
  store i64 %9, ptr %3, align 16, !tbaa !8
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %11 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %12 = load i8, ptr %11, align 8, !tbaa !12, !range !58, !noundef !52
  store i8 %12, ptr %10, align 8, !tbaa !12
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %14 = xor i8 %5, 1
  store i8 %14, ptr %13, align 1, !tbaa !13
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 26
  store i8 %5, ptr %15, align 2, !tbaa !14
  br i1 %6, label %16, label %17

16:                                               ; preds = %2
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %0, ptr noundef nonnull align 16 dereferenceable(16) %1, i64 16, i1 false), !tbaa.struct !112
  br label %32

17:                                               ; preds = %2
  %18 = load i64, ptr %7, align 16, !tbaa !8
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %18, i64 noundef %18) #19
  %19 = load i8, ptr %13, align 1, !tbaa !13, !range !58, !noundef !52
  %20 = trunc nuw i8 %19 to i1
  %21 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %22 = load ptr, ptr %21, align 8
  %23 = select i1 %20, ptr %0, ptr %22
  %24 = getelementptr inbounds nuw i8, ptr %1, i64 25
  %25 = load i8, ptr %24, align 1, !tbaa !13, !range !58, !noundef !52
  %26 = trunc nuw i8 %25 to i1
  %27 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %28 = load ptr, ptr %27, align 8
  %29 = select i1 %26, ptr %1, ptr %28
  %30 = load i64, ptr %7, align 16, !tbaa !8
  %31 = shl i64 %30, 3
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %23, ptr align 8 %29, i64 %31, i1 false)
  br label %32

32:                                               ; preds = %17, %16
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends14eval_incrementILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_(ptr noundef nonnull align 16 dereferenceable(27) %0) local_unnamed_addr #1 comdat {
  %2 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #22
  store i64 1, ptr %2, align 8, !tbaa !59
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %4 = load i8, ptr %3, align 8, !tbaa !12, !range !58, !noundef !52
  %5 = trunc nuw i8 %4 to i1
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %7 = load i8, ptr %6, align 1, !tbaa !13, !range !58, !noundef !52
  %8 = trunc nuw i8 %7 to i1
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %10 = load ptr, ptr %9, align 8
  %11 = select i1 %8, ptr %0, ptr %10
  %12 = load i64, ptr %11, align 8, !tbaa !59
  br i1 %5, label %17, label %13

13:                                               ; preds = %1
  %14 = icmp eq i64 %12, -1
  br i1 %14, label %30, label %15

15:                                               ; preds = %13
  %16 = add nuw i64 %12, 1
  store i64 %16, ptr %11, align 8, !tbaa !59
  br label %31

17:                                               ; preds = %1
  %18 = icmp eq i64 %12, 0
  br i1 %18, label %30, label %19

19:                                               ; preds = %17
  %20 = add i64 %12, -1
  store i64 %20, ptr %11, align 8, !tbaa !59
  %21 = load ptr, ptr %9, align 8
  %22 = select i1 %8, ptr %0, ptr %21
  %23 = load i64, ptr %22, align 8, !tbaa !59
  %24 = icmp eq i64 %23, 0
  %25 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %26 = load i64, ptr %25, align 16
  %27 = icmp eq i64 %26, 1
  %28 = select i1 %24, i1 %27, i1 false
  br i1 %28, label %29, label %31

29:                                               ; preds = %19
  store i8 0, ptr %3, align 8, !tbaa !12
  br label %31

30:                                               ; preds = %13, %17
  call void @_ZN5boost14multiprecision8backends8eval_addILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 8 dereferenceable(8) %2) #19
  br label %31

31:                                               ; preds = %30, %29, %19, %15
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #22
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends16right_shift_byteINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEEvRT_o(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #1 comdat {
  %4 = zext i64 %2 to i128
  %5 = shl nuw i128 %4, 64
  %6 = zext i64 %1 to i128
  %7 = or disjoint i128 %5, %6
  %8 = lshr i128 %7, 6
  %9 = trunc i128 %8 to i64
  %10 = and i128 %6, 7
  %11 = icmp eq i128 %10, 0
  br i1 %11, label %13, label %12

12:                                               ; preds = %3
  tail call void @__assert_fail(ptr noundef nonnull @.str.15, ptr noundef nonnull @.str.16, i32 noundef 524, ptr noundef nonnull @__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends16right_shift_byteINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEEvRT_o) #20
  unreachable

13:                                               ; preds = %3
  %14 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %15 = load i64, ptr %14, align 16, !tbaa !8
  %16 = icmp ugt i64 %15, %9
  br i1 %16, label %19, label %17

17:                                               ; preds = %13
  %18 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef 0) #18
  br label %50

19:                                               ; preds = %13
  %20 = sub nuw i64 %15, %9
  %21 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %22 = load i8, ptr %21, align 1, !tbaa !13, !range !58, !noundef !52
  %23 = trunc nuw i8 %22 to i1
  %24 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %25 = load ptr, ptr %24, align 8
  %26 = select i1 %23, ptr %0, ptr %25
  %27 = lshr exact i128 %7, 3
  %28 = trunc i128 %27 to i64
  %29 = getelementptr inbounds nuw i8, ptr %26, i64 %28
  %30 = shl i64 %15, 3
  %31 = sub i64 %30, %28
  tail call void @llvm.memmove.p0.p0.i64(ptr align 1 %26, ptr align 1 %29, i64 %31, i1 false)
  %32 = shl i64 %28, 3
  %33 = and i64 %32, 56
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %48, label %35

35:                                               ; preds = %19
  %36 = sub nuw nsw i64 64, %33
  %37 = shl nsw i64 -1, %36
  %38 = xor i64 %37, -1
  %39 = getelementptr i64, ptr %26, i64 %20
  %40 = getelementptr i8, ptr %39, i64 -8
  %41 = load i64, ptr %40, align 8, !tbaa !59
  %42 = and i64 %41, %38
  store i64 %42, ptr %40, align 8, !tbaa !59
  %43 = icmp eq i64 %42, 0
  %44 = icmp ugt i64 %20, 1
  %45 = select i1 %43, i1 %44, i1 false
  %46 = sext i1 %45 to i64
  %47 = add i64 %20, %46
  br label %48

48:                                               ; preds = %35, %19
  %49 = phi i64 [ %20, %19 ], [ %47, %35 ]
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %49, i64 noundef %49) #19
  br label %50

50:                                               ; preds = %48, %17
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends19right_shift_genericINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEEvRT_o(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #1 comdat {
  %4 = zext i64 %2 to i128
  %5 = shl nuw i128 %4, 64
  %6 = zext i64 %1 to i128
  %7 = or disjoint i128 %5, %6
  %8 = lshr i128 %7, 6
  %9 = trunc i128 %8 to i64
  %10 = and i64 %1, 63
  %11 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %12 = load i64, ptr %11, align 16, !tbaa !8
  %13 = icmp ugt i64 %12, %9
  br i1 %13, label %16, label %14

14:                                               ; preds = %3
  %15 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef 0) #18
  br label %57

16:                                               ; preds = %3
  %17 = sub nuw i64 %12, %9
  %18 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %19 = load i8, ptr %18, align 1, !tbaa !13, !range !58, !noundef !52
  %20 = trunc nuw i8 %19 to i1
  %21 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %22 = load ptr, ptr %21, align 8
  %23 = select i1 %20, ptr %0, ptr %22
  %24 = getelementptr i64, ptr %23, i64 %12
  %25 = getelementptr i8, ptr %24, i64 -8
  %26 = load i64, ptr %25, align 8, !tbaa !59
  %27 = lshr i64 %26, %10
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %34

29:                                               ; preds = %16
  %30 = add i64 %17, -1
  %31 = icmp eq i64 %30, 0
  br i1 %31, label %32, label %34

32:                                               ; preds = %29
  %33 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef 0) #18
  br label %57

34:                                               ; preds = %29, %16
  %35 = phi i64 [ %30, %29 ], [ %17, %16 ]
  %36 = icmp eq i64 %10, 0
  br i1 %36, label %40, label %37

37:                                               ; preds = %34
  %38 = sub nuw nsw i64 64, %10
  %39 = add i64 %9, 1
  br label %41

40:                                               ; preds = %34
  tail call void @__assert_fail(ptr noundef nonnull @.str.17, ptr noundef nonnull @.str.16, i32 noundef 592, ptr noundef nonnull @__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends19right_shift_genericINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEEvRT_o) #20
  unreachable

41:                                               ; preds = %37, %50
  %42 = phi i64 [ %55, %50 ], [ 0, %37 ]
  %43 = add i64 %42, %9
  %44 = add i64 %42, %39
  %45 = icmp ult i64 %44, %12
  %46 = getelementptr inbounds nuw i64, ptr %23, i64 %43
  %47 = load i64, ptr %46, align 8, !tbaa !59
  %48 = lshr i64 %47, %10
  %49 = getelementptr inbounds nuw i64, ptr %23, i64 %42
  store i64 %48, ptr %49, align 8, !tbaa !59
  br i1 %45, label %50, label %56

50:                                               ; preds = %41
  %51 = getelementptr inbounds nuw i64, ptr %23, i64 %44
  %52 = load i64, ptr %51, align 8, !tbaa !59
  %53 = shl i64 %52, %38
  %54 = or disjoint i64 %53, %48
  store i64 %54, ptr %49, align 8, !tbaa !59
  %55 = add nuw i64 %42, 1
  br label %41, !llvm.loop !115

56:                                               ; preds = %41
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %35, i64 noundef %35) #19
  br label %57

57:                                               ; preds = %32, %56, %14
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends14eval_decrementILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_(ptr noundef nonnull align 16 dereferenceable(27) %0) local_unnamed_addr #1 comdat {
  %2 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #22
  store i64 1, ptr %2, align 8, !tbaa !59
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %4 = load i8, ptr %3, align 8, !tbaa !12, !range !58, !noundef !52
  %5 = trunc nuw i8 %4 to i1
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %7 = load i8, ptr %6, align 1, !tbaa !13, !range !58, !noundef !52
  %8 = trunc nuw i8 %7 to i1
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %10 = load ptr, ptr %9, align 8
  %11 = select i1 %8, ptr %0, ptr %10
  %12 = load i64, ptr %11, align 8, !tbaa !59
  br i1 %5, label %17, label %13

13:                                               ; preds = %1
  %14 = icmp eq i64 %12, 0
  br i1 %14, label %21, label %15

15:                                               ; preds = %13
  %16 = add i64 %12, -1
  store i64 %16, ptr %11, align 8, !tbaa !59
  br label %22

17:                                               ; preds = %1
  %18 = icmp eq i64 %12, -1
  br i1 %18, label %21, label %19

19:                                               ; preds = %17
  %20 = add nuw i64 %12, 1
  store i64 %20, ptr %11, align 8, !tbaa !59
  br label %22

21:                                               ; preds = %13, %17
  call void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 8 dereferenceable(8) %2) #19
  br label %22

22:                                               ; preds = %19, %21, %15
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #22
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr writeonly captures(none), ptr readonly captures(none), i64, i1 immarg) #7

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends13eval_subtractILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEvE4typeERS9_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #1 comdat {
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %4 = load i8, ptr %3, align 8, !tbaa !12, !range !58, !noundef !52
  %5 = trunc nuw i8 %4 to i1
  br i1 %5, label %6, label %7

6:                                                ; preds = %2
  tail call void @_ZN5boost14multiprecision8backends12add_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvRT_RKT0_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #19
  br label %8

7:                                                ; preds = %2
  tail call void @_ZN5boost14multiprecision8backends17subtract_unsignedINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvRT_RKT0_RKy(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #19
  br label %8

8:                                                ; preds = %7, %6
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef i32 @_ZNSt8__detail14__to_chars_lenIyEEjT_i(i64 noundef %0, i32 noundef %1) local_unnamed_addr #3 comdat {
  %3 = mul nsw i32 %1, %1
  %4 = mul i32 %3, %1
  %5 = mul i32 %4, %1
  %6 = zext i32 %5 to i64
  %7 = zext i32 %1 to i64
  %8 = zext nneg i32 %3 to i64
  %9 = zext i32 %4 to i64
  br label %10

10:                                               ; preds = %26, %2
  %11 = phi i32 [ 1, %2 ], [ %28, %26 ]
  %12 = phi i64 [ %0, %2 ], [ %27, %26 ]
  %13 = icmp ult i64 %12, %7
  br i1 %13, label %29, label %14

14:                                               ; preds = %10
  %15 = icmp ult i64 %12, %8
  br i1 %15, label %16, label %18

16:                                               ; preds = %14
  %17 = add i32 %11, 1
  br label %29

18:                                               ; preds = %14
  %19 = icmp ult i64 %12, %9
  br i1 %19, label %20, label %22

20:                                               ; preds = %18
  %21 = add i32 %11, 2
  br label %29

22:                                               ; preds = %18
  %23 = icmp ult i64 %12, %6
  br i1 %23, label %24, label %26

24:                                               ; preds = %22
  %25 = add i32 %11, 3
  br label %29

26:                                               ; preds = %22
  %27 = udiv i64 %12, %6
  %28 = add i32 %11, 4
  br label %10, !llvm.loop !116

29:                                               ; preds = %10, %24, %20, %16
  %30 = phi i32 [ %17, %16 ], [ %21, %20 ], [ %25, %24 ], [ %11, %10 ]
  ret i32 %30
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE22__resize_and_overwriteIZNS_9to_stringEyEUlPcmE_EEvmT_(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %1, i64 %2) local_unnamed_addr #3 comdat align 2 {
  tail call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %1) #18
  %4 = load ptr, ptr %0, align 8, !tbaa !100
  %5 = trunc i64 %1 to i32
  tail call void @_ZNSt8__detail18__to_chars_10_implIyEEvPcjT_(ptr noundef %4, i32 noundef %5, i64 noundef %2) #18
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 8
  store i64 %1, ptr %6, align 8, !tbaa !39
  %7 = load ptr, ptr %0, align 8, !tbaa !100
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 %1
  store i8 0, ptr %8, align 1, !tbaa !6
  ret void
}

; Function Attrs: minsize optsize
declare dso_local void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm(ptr noundef nonnull align 8 dereferenceable(32), i64 noundef) local_unnamed_addr #13

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZNSt8__detail18__to_chars_10_implIyEEvPcjT_(ptr noundef %0, i32 noundef %1, i64 noundef %2) local_unnamed_addr #3 comdat {
  %4 = add i32 %1, -1
  br label %5

5:                                                ; preds = %9, %3
  %6 = phi i32 [ %4, %3 ], [ %23, %9 ]
  %7 = phi i64 [ %2, %3 ], [ %12, %9 ]
  %8 = icmp ugt i64 %7, 99
  br i1 %8, label %9, label %24

9:                                                ; preds = %5
  %10 = urem i64 %7, 100
  %11 = shl nuw nsw i64 %10, 1
  %12 = udiv i64 %7, 100
  %13 = or disjoint i64 %11, 1
  %14 = getelementptr inbounds nuw [201 x i8], ptr @__const._ZNSt8__detail18__to_chars_10_implIyEEvPcjT_.__digits, i64 0, i64 %13
  %15 = load i8, ptr %14, align 1, !tbaa !6
  %16 = zext i32 %6 to i64
  %17 = getelementptr inbounds nuw i8, ptr %0, i64 %16
  store i8 %15, ptr %17, align 1, !tbaa !6
  %18 = getelementptr inbounds nuw [201 x i8], ptr @__const._ZNSt8__detail18__to_chars_10_implIyEEvPcjT_.__digits, i64 0, i64 %11
  %19 = load i8, ptr %18, align 2, !tbaa !6
  %20 = add i32 %6, -1
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds nuw i8, ptr %0, i64 %21
  store i8 %19, ptr %22, align 1, !tbaa !6
  %23 = add i32 %6, -2
  br label %5, !llvm.loop !117

24:                                               ; preds = %5
  %25 = icmp samesign ugt i64 %7, 9
  br i1 %25, label %26, label %34

26:                                               ; preds = %24
  %27 = shl nuw nsw i64 %7, 1
  %28 = or disjoint i64 %27, 1
  %29 = getelementptr inbounds nuw [201 x i8], ptr @__const._ZNSt8__detail18__to_chars_10_implIyEEvPcjT_.__digits, i64 0, i64 %28
  %30 = load i8, ptr %29, align 1, !tbaa !6
  %31 = getelementptr inbounds nuw i8, ptr %0, i64 1
  store i8 %30, ptr %31, align 1, !tbaa !6
  %32 = getelementptr inbounds nuw [201 x i8], ptr @__const._ZNSt8__detail18__to_chars_10_implIyEEvPcjT_.__digits, i64 0, i64 %27
  %33 = load i8, ptr %32, align 2, !tbaa !6
  br label %37

34:                                               ; preds = %24
  %35 = trunc nuw nsw i64 %7 to i8
  %36 = or disjoint i8 %35, 48
  br label %37

37:                                               ; preds = %34, %26
  %38 = phi i8 [ %36, %34 ], [ %33, %26 ]
  store i8 %38, ptr %0, align 1, !tbaa !6
  ret void
}

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZN5boost14multiprecision8backends12eval_is_zeroILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEENSt9enable_ifIXntsr18is_trivial_cpp_intINS1_15cpp_int_backendIXT_EXT0_EXT1_EXT2_ET3_EEEE5valueEbE4typeERKS9_(ptr noundef nonnull align 16 dereferenceable(27) %0) local_unnamed_addr #1 comdat {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %3 = load i64, ptr %2, align 16, !tbaa !8
  %4 = icmp eq i64 %3, 1
  br i1 %4, label %5, label %14

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %7 = load i8, ptr %6, align 1, !tbaa !13, !range !58, !noundef !52
  %8 = trunc nuw i8 %7 to i1
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %10 = load ptr, ptr %9, align 8
  %11 = select i1 %8, ptr %0, ptr %10
  %12 = load i64, ptr %11, align 8, !tbaa !59
  %13 = icmp eq i64 %12, 0
  br label %14

14:                                               ; preds = %5, %1
  %15 = phi i1 [ false, %1 ], [ %13, %5 ]
  ret i1 %15
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local void @_ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvPT_RKT0_yRS8_(ptr noundef %0, ptr noundef nonnull align 16 dereferenceable(27) %1, i64 noundef %2, ptr noundef nonnull align 16 dereferenceable(27) %3) local_unnamed_addr #3 comdat {
  %5 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %6 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  %7 = alloca %"class.std::overflow_error", align 8
  %8 = icmp eq ptr %0, %1
  %9 = icmp eq ptr %3, %1
  %10 = or i1 %8, %9
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %5) #22
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EEC2ERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %5, ptr noundef nonnull align 16 dereferenceable(27) %1) #19
  call void @_ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvPT_RKT0_yRS8_(ptr noundef %0, ptr noundef nonnull align 16 dereferenceable(27) %5, i64 noundef %2, ptr noundef nonnull align 16 dereferenceable(27) %3) #19
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %5) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %5) #22
  br label %171

12:                                               ; preds = %4
  %13 = icmp eq ptr %0, %3
  br i1 %13, label %14, label %19

14:                                               ; preds = %12
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %6) #22
  store i64 0, ptr %6, align 16, !tbaa !6
  %15 = getelementptr inbounds nuw i8, ptr %6, i64 16
  store i64 1, ptr %15, align 16, !tbaa !8
  %16 = getelementptr inbounds nuw i8, ptr %6, i64 24
  store i8 0, ptr %16, align 8, !tbaa !12
  %17 = getelementptr inbounds nuw i8, ptr %6, i64 25
  store i8 1, ptr %17, align 1, !tbaa !13
  %18 = getelementptr inbounds nuw i8, ptr %6, i64 26
  store i8 0, ptr %18, align 2, !tbaa !14
  call void @_ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvPT_RKT0_yRS8_(ptr noundef %0, ptr noundef nonnull align 16 dereferenceable(27) %1, i64 noundef %2, ptr noundef nonnull align 16 dereferenceable(27) %6) #19
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6assignERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %6) #19
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %6) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %6) #22
  br label %171

19:                                               ; preds = %12
  %20 = icmp eq i64 %2, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %19
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %7) #22
  call void @_ZNSt14overflow_errorC1EPKc(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull @.str.25) #18
  call void @_ZN5boost15throw_exceptionERKSt9exceptionRKNS_15source_locationE(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr nonnull align 8 poison) #26
  unreachable

22:                                               ; preds = %19
  %23 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %24 = load i64, ptr %23, align 16, !tbaa !8
  %25 = add i64 %24, -1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6assignERKS6_(ptr noundef nonnull align 16 dereferenceable(27) %3, ptr noundef nonnull align 16 dereferenceable(27) %1) #19
  %26 = getelementptr inbounds nuw i8, ptr %3, i64 24
  store i8 0, ptr %26, align 8, !tbaa !12
  %27 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %28 = getelementptr inbounds nuw i8, ptr %3, i64 25
  %29 = load i8, ptr %28, align 1, !tbaa !13, !range !58, !noundef !52
  %30 = trunc nuw i8 %29 to i1
  %31 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %32 = load ptr, ptr %31, align 8
  %33 = select i1 %30, ptr %3, ptr %32
  switch i64 %24, label %81 [
    i64 1, label %34
    i64 2, label %55
  ]

34:                                               ; preds = %22
  %35 = load i64, ptr %33, align 8, !tbaa !59
  %36 = icmp ult i64 %35, %2
  %37 = icmp eq ptr %0, null
  br i1 %36, label %38, label %41

38:                                               ; preds = %34
  br i1 %37, label %171, label %39

39:                                               ; preds = %38
  %40 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef 0) #18
  br label %171

41:                                               ; preds = %34
  br i1 %37, label %49, label %42

42:                                               ; preds = %41
  %43 = udiv i64 %35, %2
  %44 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %43) #18
  %45 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %46 = load i8, ptr %45, align 8, !tbaa !12, !range !58, !noundef !52
  %47 = trunc nuw i8 %46 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %47) #18
  %48 = load i64, ptr %33, align 8, !tbaa !59
  br label %49

49:                                               ; preds = %42, %41
  %50 = phi i64 [ %48, %42 ], [ %35, %41 ]
  %51 = urem i64 %50, %2
  store i64 %51, ptr %33, align 8, !tbaa !59
  %52 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %53 = load i8, ptr %52, align 8, !tbaa !12, !range !58, !noundef !52
  %54 = trunc nuw i8 %53 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %3, i1 noundef zeroext %54) #18
  br label %171

55:                                               ; preds = %22
  %56 = getelementptr inbounds nuw i8, ptr %33, i64 8
  %57 = load i64, ptr %56, align 8, !tbaa !59
  %58 = zext i64 %57 to i128
  %59 = shl nuw i128 %58, 64
  %60 = load i64, ptr %33, align 8, !tbaa !59
  %61 = zext i64 %60 to i128
  %62 = or disjoint i128 %59, %61
  %63 = icmp eq ptr %0, null
  %64 = zext i64 %2 to i128
  br i1 %63, label %74, label %65

65:                                               ; preds = %55
  %66 = udiv i128 %62, %64
  %67 = trunc i128 %66 to i64
  %68 = lshr i128 %66, 64
  %69 = trunc nuw i128 %68 to i64
  %70 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIoEENSt9enable_ifIXaasr3std7is_sameIT_oEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %67, i64 noundef %69) #18
  %71 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %72 = load i8, ptr %71, align 8, !tbaa !12, !range !58, !noundef !52
  %73 = trunc nuw i8 %72 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %73) #18
  br label %74

74:                                               ; preds = %55, %65
  %75 = urem i128 %62, %64
  %76 = trunc nuw i128 %75 to i64
  %77 = tail call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIoEENSt9enable_ifIXaasr3std7is_sameIT_oEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %3, i64 noundef %76, i64 noundef 0) #18
  %78 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %79 = load i8, ptr %78, align 8, !tbaa !12, !range !58, !noundef !52
  %80 = trunc nuw i8 %79 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %3, i1 noundef zeroext %80) #18
  br label %171

81:                                               ; preds = %22
  %82 = icmp eq ptr %0, null
  br i1 %82, label %95, label %83

83:                                               ; preds = %81
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %24, i64 noundef %24) #19
  %84 = getelementptr inbounds nuw i8, ptr %0, i64 25
  %85 = load i8, ptr %84, align 1, !tbaa !13, !range !58, !noundef !52
  %86 = trunc nuw i8 %85 to i1
  %87 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %88 = load ptr, ptr %87, align 8
  %89 = select i1 %86, ptr %0, ptr %88
  %90 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %91 = load i64, ptr %90, align 16, !tbaa !8
  %92 = icmp ugt i64 %91, %25
  br i1 %92, label %93, label %95

93:                                               ; preds = %83
  %94 = getelementptr inbounds nuw i64, ptr %89, i64 %25
  store i64 0, ptr %94, align 8, !tbaa !59
  br label %95

95:                                               ; preds = %83, %93, %81
  %96 = phi ptr [ %89, %93 ], [ %89, %83 ], [ null, %81 ]
  %97 = zext i64 %2 to i128
  br label %98

98:                                               ; preds = %154, %95
  %99 = phi i64 [ %25, %95 ], [ %155, %154 ]
  %100 = getelementptr inbounds nuw i64, ptr %33, i64 %99
  %101 = icmp ne i64 %99, 0
  %102 = getelementptr inbounds nuw i64, ptr %96, i64 %99
  br label %103

103:                                              ; preds = %98, %142
  %104 = load i64, ptr %100, align 8, !tbaa !59
  %105 = icmp ult i64 %104, %2
  %106 = and i1 %101, %105
  br i1 %106, label %107, label %135

107:                                              ; preds = %103
  %108 = zext i64 %104 to i128
  %109 = shl nuw i128 %108, 64
  %110 = getelementptr i8, ptr %100, i64 -8
  %111 = load i64, ptr %110, align 8, !tbaa !59
  %112 = zext i64 %111 to i128
  %113 = or disjoint i128 %109, %112
  %114 = freeze i128 %113
  %115 = udiv i128 %114, %97
  %116 = mul i128 %115, %97
  %117 = sub i128 %114, %116
  %118 = load i64, ptr %27, align 16, !tbaa !8
  %119 = add i64 %118, -1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %3, i64 noundef %119, i64 noundef %119) #19
  %120 = add i64 %99, -1
  %121 = trunc nuw i128 %117 to i64
  %122 = getelementptr inbounds nuw i64, ptr %33, i64 %120
  store i64 %121, ptr %122, align 8, !tbaa !59
  br i1 %82, label %126, label %123

123:                                              ; preds = %107
  %124 = trunc i128 %115 to i64
  %125 = getelementptr inbounds nuw i64, ptr %96, i64 %120
  store i64 %124, ptr %125, align 8, !tbaa !59
  br label %126

126:                                              ; preds = %123, %107
  %127 = icmp eq i64 %120, 0
  br i1 %127, label %156, label %128

128:                                              ; preds = %126
  %129 = load i64, ptr %122, align 8, !tbaa !59
  %130 = icmp eq i64 %129, 0
  br i1 %130, label %131, label %154

131:                                              ; preds = %128
  %132 = add i64 %99, -2
  %133 = load i64, ptr %27, align 16, !tbaa !8
  %134 = add i64 %133, -1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %3, i64 noundef %134, i64 noundef %134) #19
  br i1 %82, label %151, label %148

135:                                              ; preds = %103
  br i1 %82, label %139, label %136

136:                                              ; preds = %135
  %137 = udiv i64 %104, %2
  store i64 %137, ptr %102, align 8, !tbaa !59
  %138 = load i64, ptr %100, align 8, !tbaa !59
  br label %139

139:                                              ; preds = %136, %135
  %140 = phi i64 [ %138, %136 ], [ %104, %135 ]
  %141 = urem i64 %140, %2
  store i64 %141, ptr %100, align 8, !tbaa !59
  br i1 %101, label %142, label %156

142:                                              ; preds = %139
  %143 = icmp eq i64 %141, 0
  br i1 %143, label %144, label %103, !llvm.loop !118

144:                                              ; preds = %142
  %145 = add i64 %99, -1
  %146 = load i64, ptr %27, align 16, !tbaa !8
  %147 = add i64 %146, -1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE6resizeEmm(ptr noundef nonnull align 16 dereferenceable(27) %3, i64 noundef %147, i64 noundef %147) #19
  br i1 %82, label %151, label %148

148:                                              ; preds = %144, %131
  %149 = phi i64 [ %132, %131 ], [ %145, %144 ]
  %150 = getelementptr inbounds nuw i64, ptr %96, i64 %149
  store i64 0, ptr %150, align 8, !tbaa !59
  br label %151

151:                                              ; preds = %148, %131, %144
  %152 = phi i64 [ %145, %144 ], [ %132, %131 ], [ %149, %148 ]
  %153 = icmp eq i64 %152, 0
  br i1 %153, label %156, label %154

154:                                              ; preds = %151, %156, %128
  %155 = phi i64 [ %120, %128 ], [ 0, %156 ], [ %152, %151 ]
  br label %98, !llvm.loop !118

156:                                              ; preds = %139, %126, %151
  %157 = load i64, ptr %33, align 8, !tbaa !59
  %158 = icmp ult i64 %157, %2
  br i1 %158, label %159, label %154

159:                                              ; preds = %156
  br i1 %82, label %164, label %160

160:                                              ; preds = %159
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE9normalizeEv(ptr noundef nonnull align 16 dereferenceable(27) %0) #18
  %161 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %162 = load i8, ptr %161, align 8, !tbaa !12, !range !58, !noundef !52
  %163 = trunc nuw i8 %162 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %0, i1 noundef zeroext %163) #18
  br label %164

164:                                              ; preds = %160, %159
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE9normalizeEv(ptr noundef nonnull align 16 dereferenceable(27) %3) #18
  %165 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %166 = load i8, ptr %165, align 8, !tbaa !12, !range !58, !noundef !52
  %167 = trunc nuw i8 %166 to i1
  tail call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EE4signEb(ptr noundef nonnull align 16 dereferenceable(27) %3, i1 noundef zeroext %167) #18
  %168 = tail call noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE7compareIyEENSt9enable_ifIXsr5boost14multiprecision6detail13is_arithmeticIT_EE5valueEiE4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %3, i64 noundef %2) #19
  %169 = icmp slt i32 %168, 0
  br i1 %169, label %171, label %170

170:                                              ; preds = %164
  tail call void @__assert_fail(ptr noundef nonnull @.str.27, ptr noundef nonnull @.str.22, i32 noundef 453, ptr noundef nonnull @__PRETTY_FUNCTION__._ZN5boost14multiprecision8backends22divide_unsigned_helperINS1_15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEES7_EEvPT_RKT0_yRS8_) #20
  unreachable

171:                                              ; preds = %49, %74, %39, %38, %164, %11, %14
  ret void
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE7compareILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EE(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1) local_unnamed_addr #3 comdat align 2 {
  %3 = alloca %"struct.std::integral_constant.3", align 1
  %4 = alloca %"struct.std::integral_constant.3", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %3) #22
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #22
  %5 = call noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE11compare_impILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EERKSt17integral_constantIbLb0EESF_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 1 dereferenceable(1) %4) #18
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #22
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %3) #22
  ret i32 %5
}

; Function Attrs: minsize optsize
declare dso_local void @_ZNSt14overflow_errorC1EPKc(ptr noundef nonnull align 8 dereferenceable(16), ptr noundef) unnamed_addr #13

; Function Attrs: inlinehint minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE7compareIyEENSt9enable_ifIXsr5boost14multiprecision6detail13is_arithmeticIT_EE5valueEiE4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %0, i64 noundef %1) local_unnamed_addr #1 comdat align 2 {
  %3 = alloca %"struct.boost::multiprecision::backends::cpp_int_backend", align 16
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %3) #22
  store i64 0, ptr %3, align 16, !tbaa !6
  %4 = getelementptr inbounds nuw i8, ptr %3, i64 16
  store i64 1, ptr %4, align 16, !tbaa !8
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 24
  store i8 0, ptr %5, align 8, !tbaa !12
  %6 = getelementptr inbounds nuw i8, ptr %3, i64 25
  store i8 1, ptr %6, align 1, !tbaa !13
  %7 = getelementptr inbounds nuw i8, ptr %3, i64 26
  store i8 0, ptr %7, align 2, !tbaa !14
  %8 = call noundef nonnull align 16 dereferenceable(27) ptr @_ZN5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEaSIyEENSt9enable_ifIXaasr3std7is_sameIT_yEE5valuentL_ZNSt17integral_constantIbLb0EE5valueEEERS6_E4typeES9_(ptr noundef nonnull align 16 dereferenceable(27) %3, i64 noundef %1) #18
  %9 = call noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE7compareILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EE(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %3) #18
  call void @_ZN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EED2Ev(ptr noundef nonnull align 16 dereferenceable(27) %3) #18
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %3) #22
  ret i32 %9
}

; Function Attrs: minsize mustprogress nounwind optsize uwtable
define linkonce_odr dso_local noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE11compare_impILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EERKSt17integral_constantIbLb0EESF_(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1, ptr noundef nonnull align 1 dereferenceable(1) %2, ptr noundef nonnull align 1 dereferenceable(1) %3) local_unnamed_addr #3 comdat align 2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %6 = load i8, ptr %5, align 8, !tbaa !12, !range !58, !noundef !52
  %7 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %8 = load i8, ptr %7, align 8, !tbaa !12, !range !58, !noundef !52
  %9 = icmp eq i8 %6, %8
  br i1 %9, label %13, label %10

10:                                               ; preds = %4
  %11 = trunc nuw i8 %6 to i1
  %12 = select i1 %11, i32 -1, i32 1
  br label %19

13:                                               ; preds = %4
  %14 = tail call noundef i32 @_ZNK5boost14multiprecision8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEE16compare_unsignedILm0ELm0ELS3_1ELS4_0ES5_EEiRKNS2_IXT_EXT0_EXT1_EXT2_ET3_EE(ptr noundef nonnull align 16 dereferenceable(27) %0, ptr noundef nonnull align 16 dereferenceable(27) %1) #18
  %15 = load i8, ptr %5, align 8, !tbaa !12, !range !58, !noundef !52
  %16 = trunc nuw i8 %15 to i1
  %17 = sub nsw i32 0, %14
  %18 = select i1 %16, i32 %17, i32 %14
  br label %19

19:                                               ; preds = %13, %10
  %20 = phi i32 [ %12, %10 ], [ %18, %13 ]
  ret i32 %20
}

; Function Attrs: minsize optsize
declare dso_local void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEmc(ptr noundef nonnull align 8 dereferenceable(32), i64 noundef, i8 noundef signext) local_unnamed_addr #13

; Function Attrs: minsize mustprogress nounwind optsize uwtable
declare dso_local void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv(ptr noundef nonnull align 8 dereferenceable(32)) local_unnamed_addr #3 align 2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #15

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #16

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #16

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #16

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #16

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #17

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.usub.sat.i64(i64, i64) #16

attributes #0 = { cold minsize mustprogress noreturn nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inlinehint minsize mustprogress nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold minsize nofree noreturn nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { minsize mustprogress nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { minsize nobuiltin optsize allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { cold minsize noreturn nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { minsize noreturn optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { minsize nobuiltin nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #11 = { minsize mustprogress nocallback nofree nounwind optsize willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #13 = { minsize optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { minsize nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #16 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #17 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #18 = { minsize nounwind optsize }
attributes #19 = { minsize optsize }
attributes #20 = { cold minsize noreturn nounwind optsize }
attributes #21 = { builtin minsize nounwind optsize allocsize(0) }
attributes #22 = { nounwind }
attributes #23 = { builtin minsize nounwind optsize }
attributes #24 = { minsize noreturn nounwind optsize }
attributes #25 = { minsize nounwind optsize willreturn memory(read) }
attributes #26 = { minsize noreturn optsize }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"clang version 21.1.7 (Fedora 21.1.7-1.fc44)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"vtable pointer", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !5, i64 0}
!8 = !{!9, !10, i64 16}
!9 = !{!"_ZTSN5boost14multiprecision8backends12cpp_int_baseILm0ELm18446744073709551615ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyELb0EEE", !7, i64 0, !10, i64 16, !11, i64 24, !11, i64 25, !11, i64 26}
!10 = !{!"long", !7, i64 0}
!11 = !{!"bool", !7, i64 0}
!12 = !{!9, !11, i64 24}
!13 = !{!9, !11, i64 25}
!14 = !{!9, !11, i64 26}
!15 = !{!16, !16, i64 0}
!16 = !{!"p1 _ZTSN5boost14multiprecision6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEE", !17, i64 0}
!17 = !{!"any pointer", !7, i64 0}
!18 = !{!19}
!19 = distinct !{!19, !20, !"_ZN5boost14multiprecisionplINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEENS0_6detail10expressionINS8_14add_immediatesENS0_6numberIT_LNS0_26expression_template_optionE1EEESE_vvEERKSE_SH_: argument 0"}
!20 = distinct !{!20, !"_ZN5boost14multiprecisionplINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEENS0_6detail10expressionINS8_14add_immediatesENS0_6numberIT_LNS0_26expression_template_optionE1EEESE_vvEERKSE_SH_"}
!21 = !{!22}
!22 = distinct !{!22, !23, !"_ZN5boost14multiprecisionmiINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEENS0_6detail10expressionINS8_19subtract_immediatesENS0_6numberIT_LNS0_26expression_template_optionE1EEESE_vvEERKSE_SH_: argument 0"}
!23 = distinct !{!23, !"_ZN5boost14multiprecisionmiINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEENS0_6detail10expressionINS8_19subtract_immediatesENS0_6numberIT_LNS0_26expression_template_optionE1EEESE_vvEERKSE_SH_"}
!24 = !{!25}
!25 = distinct !{!25, !26, !"_ZN5boost14multiprecisionngINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEENS0_6detail10expressionINS8_6negateENS0_6numberIT_LNS0_26expression_template_optionE1EEEvvvEERKSE_: argument 0"}
!26 = distinct !{!26, !"_ZN5boost14multiprecisionngINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEENS0_6detail10expressionINS8_6negateENS0_6numberIT_LNS0_26expression_template_optionE1EEEvvvEERKSE_"}
!27 = !{!28, !10, i64 8}
!28 = !{!"_ZTSSt8ios_base", !10, i64 8, !10, i64 16, !29, i64 24, !30, i64 28, !30, i64 32, !31, i64 40, !32, i64 48, !7, i64 64, !33, i64 192, !34, i64 200, !35, i64 208}
!29 = !{!"_ZTSSt13_Ios_Fmtflags", !7, i64 0}
!30 = !{!"_ZTSSt12_Ios_Iostate", !7, i64 0}
!31 = !{!"p1 _ZTSNSt8ios_base14_Callback_listE", !17, i64 0}
!32 = !{!"_ZTSNSt8ios_base6_WordsE", !17, i64 0, !10, i64 8}
!33 = !{!"int", !7, i64 0}
!34 = !{!"p1 _ZTSNSt8ios_base6_WordsE", !17, i64 0}
!35 = !{!"_ZTSSt6locale", !36, i64 0}
!36 = !{!"p1 _ZTSNSt6locale5_ImplE", !17, i64 0}
!37 = !{!28, !29, i64 24}
!38 = !{!28, !10, i64 16}
!39 = !{!40, !10, i64 8}
!40 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !41, i64 0, !10, i64 8, !7, i64 16}
!41 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !42, i64 0}
!42 = !{!"p1 omnipotent char", !17, i64 0}
!43 = !{!42, !42, i64 0}
!44 = !{!45}
!45 = distinct !{!45, !46, !"_ZN5boost14multiprecisionngINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEENS0_6detail10expressionINS8_6negateENS0_6numberIT_LNS0_26expression_template_optionE1EEEvvvEERKSE_: argument 0"}
!46 = distinct !{!46, !"_ZN5boost14multiprecisionngINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEEEENS0_6detail10expressionINS8_6negateENS0_6numberIT_LNS0_26expression_template_optionE1EEEvvvEERKSE_"}
!47 = !{!48, !16, i64 0}
!48 = !{!"_ZTSN5boost14multiprecision6detail10expressionINS1_14add_immediatesENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEESC_vvEE", !16, i64 0, !16, i64 8}
!49 = !{!50}
!50 = distinct !{!50, !51, !"_ZNK5boost14multiprecision6detail10expressionINS1_14add_immediatesENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEESC_vvE4leftEv: argument 0"}
!51 = distinct !{!51, !"_ZNK5boost14multiprecision6detail10expressionINS1_14add_immediatesENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEESC_vvE4leftEv"}
!52 = !{}
!53 = !{i64 16}
!54 = !{!48, !16, i64 8}
!55 = !{!56}
!56 = distinct !{!56, !57, !"_ZNK5boost14multiprecision6detail10expressionINS1_14add_immediatesENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEESC_vvE5rightEv: argument 0"}
!57 = distinct !{!57, !"_ZNK5boost14multiprecision6detail10expressionINS1_14add_immediatesENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEESC_vvE5rightEv"}
!58 = !{i8 0, i8 2}
!59 = !{!60, !60, i64 0}
!60 = !{!"long long", !7, i64 0}
!61 = distinct !{!61, !62}
!62 = !{!"llvm.loop.mustprogress"}
!63 = distinct !{!63, !62}
!64 = distinct !{!64, !62}
!65 = distinct !{!65, !62}
!66 = distinct !{!66, !62}
!67 = distinct !{!67, !62}
!68 = distinct !{!68, !62}
!69 = distinct !{!69, !62}
!70 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!71 = !{!72, !16, i64 0}
!72 = !{!"_ZTSN5boost14multiprecision6detail10expressionINS1_19subtract_immediatesENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEESC_vvEE", !16, i64 0, !16, i64 8}
!73 = !{!74}
!74 = distinct !{!74, !75, !"_ZNK5boost14multiprecision6detail10expressionINS1_19subtract_immediatesENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEESC_vvE4leftEv: argument 0"}
!75 = distinct !{!75, !"_ZNK5boost14multiprecision6detail10expressionINS1_19subtract_immediatesENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEESC_vvE4leftEv"}
!76 = !{!72, !16, i64 8}
!77 = !{!78}
!78 = distinct !{!78, !79, !"_ZNK5boost14multiprecision6detail10expressionINS1_19subtract_immediatesENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEESC_vvE5rightEv: argument 0"}
!79 = distinct !{!79, !"_ZNK5boost14multiprecision6detail10expressionINS1_19subtract_immediatesENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEESC_vvE5rightEv"}
!80 = distinct !{!80, !62}
!81 = distinct !{!81, !62}
!82 = distinct !{!82, !62}
!83 = distinct !{!83, !62}
!84 = distinct !{!84, !62}
!85 = distinct !{!85, !62}
!86 = distinct !{!86, !62}
!87 = distinct !{!87, !62}
!88 = distinct !{!88, !62}
!89 = !{i64 0, i64 16, !6}
!90 = !{!11, !11, i64 0}
!91 = !{!10, !10, i64 0}
!92 = !{!93}
!93 = distinct !{!93, !94, !"_ZNK5boost14multiprecision6detail10expressionINS1_6negateENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEEvvvE4leftEv: argument 0"}
!94 = distinct !{!94, !"_ZNK5boost14multiprecision6detail10expressionINS1_6negateENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEEvvvE4leftEv"}
!95 = !{!96, !16, i64 0}
!96 = !{!"_ZTSN5boost14multiprecision6detail10expressionINS1_6negateENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEEvvvEE", !16, i64 0}
!97 = !{!98, !16, i64 0}
!98 = !{!"_ZTSN5boost14multiprecision6detail10expressionINS1_8terminalENS0_6numberINS0_8backends15cpp_int_backendILm0ELm0ELNS0_16cpp_integer_typeE1ELNS0_18cpp_int_check_typeE0ESaIyEEELNS0_26expression_template_optionE1EEEvvvEE", !16, i64 0}
!99 = !{!41, !42, i64 0}
!100 = !{!40, !42, i64 0}
!101 = distinct !{!101, !62}
!102 = distinct !{!102, !62}
!103 = distinct !{!103, !62}
!104 = distinct !{!104, !62}
!105 = distinct !{!105, !62}
!106 = distinct !{!106, !62}
!107 = distinct !{!107, !62}
!108 = distinct !{!108, !62}
!109 = distinct !{!109, !62}
!110 = distinct !{!110, !62}
!111 = distinct !{!111, !62}
!112 = !{i64 0, i64 8, !91, i64 8, i64 8, !113}
!113 = !{!114, !114, i64 0}
!114 = !{!"p1 long long", !17, i64 0}
!115 = distinct !{!115, !62}
!116 = distinct !{!116, !62}
!117 = distinct !{!117, !62}
!118 = distinct !{!118, !62}
