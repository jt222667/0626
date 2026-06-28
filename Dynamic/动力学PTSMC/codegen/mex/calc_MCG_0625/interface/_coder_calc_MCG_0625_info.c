/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_calc_MCG_0625_info.c
 *
 * Code generation for function 'calc_MCG_0625'
 *
 */

/* Include files */
#include "_coder_calc_MCG_0625_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

/* Function Declarations */
static const mxArray *c_emlrtMexFcnResolvedFunctionsI(void);

/* Function Definitions */
static const mxArray *c_emlrtMexFcnResolvedFunctionsI(void)
{
  const mxArray *nameCaptureInfo;
  const char_T *data[7] = {
      "789ced58dd6e124114fe68d078a1156fbcd2d817b01628847ad1845068aba2282d692a4a"
      "d761e8aedd3f761702bc8457defb1edef42dbcd11be3adf1151cd81f"
      "e83613c0256b207b089c3d73cecc373387f9e664113b2cc700acc396dc035bdf71ec84a3"
      "d77055fcfe98a36ff86c78edf12bfd5cff2747134db568cfb20d5550",
      "a8d7b3a929922aa8d6515fa730a8a9c95dda1c795a924c8f248556278d97434b294db83c"
      "63e81a3e17444a2eaa1d0586688e67284f1ade7e9c71d61b9fb21f7e"
      "f1ef873fcec5d3ff112fe66be7e1b97e22c8a4512eec37b6b2a90c82afd7c5bbc9c5b73d"
      "a665748835c6bb0c88f7988377cfd1a78e7e8b22dea184a7a8230f03",
      "0422247441b181370d22d6b1852c52ec5bc71efa502140611184d9843dcbecb781320ad8"
      "67da8ecd6093c5d8326dffeeceb81ebf1ec7df1ae9cff11fb130f11e"
      "aeff4a8489e7caffc2eb71c69bf5ff789f8397f0f90dbdaff7a52ab9d81607224d9f1e5b"
      "afe9a0349e47650aceb47980638735fe25a7ffb29eeba0bc7c9bb39e",
      "84cf3fe26541686ca593b949fcb380f861f3f22607cfcd5fddd1f3e4ef39f3a8cca3b0bc"
      "59d77228b0cf3083692491f33218168fc47f7f0f95977f9e17bf8589"
      "e7caaaf372eb4525db394c9dbcdaceab42ad40e4f3b6513b887879d9cef5aceb59f3d9f0"
      "e26c0f1960a178d378b8a9753ec8748cf72520de230e9e9baf5d47cf",
      "93af03d62ab31b7198a581939155e5d93f1b7b11cf62f13c2b158aed9372f95986746a5a"
      "b24b3eaa24df2c463cbbaaf5ef5cef2574cd740be065ad7f9f70f0dc"
      "fcbd77f4e2ee491d1acc6b37e5aaf2f257ad14f13216cfcb82d4aaa83db15adc2929c7b5"
      "f44ecd6c4b95e8bdc4d29deba8feb525aa7f83e145f5af2d51fd3bdb",
      "f87f01d8fd328d",
      ""};
  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 7248U, &nameCaptureInfo);
  return nameCaptureInfo;
}

mxArray *emlrtMexFcnProperties(void)
{
  mxArray *xEntryPoints;
  mxArray *xInputs;
  mxArray *xResult;
  const char_T *epFieldName[7] = {
      "QualifiedName",    "NumberOfInputs", "NumberOfOutputs", "ConstantInputs",
      "ResolvedFilePath", "TimeStamp",      "Visible"};
  const char_T *propFieldName[7] = {
      "Version",      "ResolvedFunctions", "Checksum", "EntryPoints",
      "CoverageInfo", "IsPolymorphic",     "AuxData"};
  uint8_T v[216] = {
      0U,   1U,   73U,  77U,  0U,   0U,   0U,   0U,   14U,  0U,   0U,   0U,
      200U, 0U,   0U,   0U,   6U,   0U,   0U,   0U,   8U,   0U,   0U,   0U,
      2U,   0U,   0U,   0U,   0U,   0U,   0U,   0U,   5U,   0U,   0U,   0U,
      8U,   0U,   0U,   0U,   1U,   0U,   0U,   0U,   1U,   0U,   0U,   0U,
      1U,   0U,   0U,   0U,   0U,   0U,   0U,   0U,   5U,   0U,   4U,   0U,
      17U,  0U,   0U,   0U,   1U,   0U,   0U,   0U,   17U,  0U,   0U,   0U,
      67U,  108U, 97U,  115U, 115U, 69U,  110U, 116U, 114U, 121U, 80U,  111U,
      105U, 110U, 116U, 115U, 0U,   0U,   0U,   0U,   0U,   0U,   0U,   0U,
      14U,  0U,   0U,   0U,   112U, 0U,   0U,   0U,   6U,   0U,   0U,   0U,
      8U,   0U,   0U,   0U,   2U,   0U,   0U,   0U,   0U,   0U,   0U,   0U,
      5U,   0U,   0U,   0U,   8U,   0U,   0U,   0U,   1U,   0U,   0U,   0U,
      0U,   0U,   0U,   0U,   1U,   0U,   0U,   0U,   0U,   0U,   0U,   0U,
      5U,   0U,   4U,   0U,   14U,  0U,   0U,   0U,   1U,   0U,   0U,   0U,
      56U,  0U,   0U,   0U,   81U,  117U, 97U,  108U, 105U, 102U, 105U, 101U,
      100U, 78U,  97U,  109U, 101U, 0U,   77U,  101U, 116U, 104U, 111U, 100U,
      115U, 0U,   0U,   0U,   0U,   0U,   0U,   0U,   80U,  114U, 111U, 112U,
      101U, 114U, 116U, 105U, 101U, 115U, 0U,   0U,   0U,   0U,   72U,  97U,
      110U, 100U, 108U, 101U, 0U,   0U,   0U,   0U,   0U,   0U,   0U,   0U};
  xEntryPoints =
      emlrtCreateStructMatrix(1, 1, 7, (const char_T **)&epFieldName[0]);
  xInputs = emlrtCreateLogicalMatrix(1, 4);
  emlrtSetField(xEntryPoints, 0, "QualifiedName",
                emlrtMxCreateString("calc_MCG_0625"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(4.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(3.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(
      xEntryPoints, 0, "ResolvedFilePath",
      emlrtMxCreateString(
          "F:\\Archive "
          "\xe5\xbd\x92\xe6\xa1\xa3\\0626\\Dynamic\\calc_MCG_0625.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(740158.80806712958));
  emlrtSetField(xEntryPoints, 0, "Visible", emlrtMxCreateLogicalScalar(true));
  xResult =
      emlrtCreateStructMatrix(1, 1, 7, (const char_T **)&propFieldName[0]);
  emlrtSetField(xResult, 0, "Version",
                emlrtMxCreateString("25.2.0.3042426 (R2025b) Update 1"));
  emlrtSetField(xResult, 0, "ResolvedFunctions",
                (mxArray *)c_emlrtMexFcnResolvedFunctionsI());
  emlrtSetField(xResult, 0, "Checksum",
                emlrtMxCreateString("AYRecUkcpAwNJq8PhcuqCC"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  emlrtSetField(xResult, 0, "AuxData",
                emlrtMxCreateRowVectorUINT8((const uint8_T *)&v, 216U));
  return xResult;
}

/* End of code generation (_coder_calc_MCG_0625_info.c) */
