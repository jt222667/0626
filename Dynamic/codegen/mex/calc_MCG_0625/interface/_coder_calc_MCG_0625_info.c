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
      "789ced58cb721241143da430e5420d6e5c59657ec0c82350e0c22a328110234a49c494a2"
      "64ec1960741e300f8ac48ff017fc0f37d9f80d6e74e3de72e9d68679"
      "4026d50538d458507329b873fbdeeed3dd77faf42d103bacc600dc822df9bbb6bee9d809"
      "476fe0b2f8fd31475ff3d9f0dae397fab9fe4f8e269a6a8a43d33654",
      "5e11bd9e82a6482aaf9ac7673d11ba6868f24014c69eb6248bc79222d6a78da7234b294f"
      "b93c63e41a3d735d917ca85b0af4ae3199a13c6d78fb71ca586f7cc6"
      "7ef8c5bf1ffe3817aff78f78315f3b0bcff5135e26ad2a77d04ae6d259045faf8bb7c9c4"
      "b73d86a95bc49ce05d04c4bbcfc0bbede8578e7e8d12dea08c8768a2",
      "081d045d481840c4369eb748b789247248d36f13fb38830a1e0a8d20d426f459a6bf2d54"
      "c1e1806a3b368b1d1a63cbacfddb9a733d7e3d89bf3ed65f377fc4c2"
      "c4fbf351d90a13cf95ff8537648c37effb78878197f0f9752e9f545e5a7a522cf42ad291"
      "d0dfdde33bdc641eb51938b3e601861dd6f8178cfeab7aae83f2f20d",
      "c67a123eff989779be95cca4f2d3f8a701f1c3e6e51d069e9bbfa6a317c9df11f5a8d4a3"
      "d0bc995772c8d3cf288319a490f73218168fc47f7d0f95977f764adf"
      "c2c47365dd79b9fda496b30ed327cf768b2adfe088dce9eb8d4ac4cbab76aee75dcf86cf"
      "8617677bc839968a378b8705cd7a278b13bccf01f1ee31f0dc7c3d72",
      "f422f9aad05699de88a32c9d3b1959579efdbdbd1ff12c96cfb31257ea9f54ab8fb3c46a"
      "68a90179af92a2508a78765debdf85fe97e869865b00af6afdfb8081"
      "e7e6efada397774ff6a0c1b87253ae2b2f7fd1ca112f63f9bccc4bed9a3aecd64b85b2f2"
      "a29129348cbe542b47bcbc6ae73aaa7f6d89eadf607851fd6b4b54ff",
      "ce37fe5f1a6a3269",
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
                emlrtMxCreateDoubleScalar(740161.59180555551));
  emlrtSetField(xEntryPoints, 0, "Visible", emlrtMxCreateLogicalScalar(true));
  xResult =
      emlrtCreateStructMatrix(1, 1, 7, (const char_T **)&propFieldName[0]);
  emlrtSetField(xResult, 0, "Version",
                emlrtMxCreateString("25.2.0.3042426 (R2025b) Update 1"));
  emlrtSetField(xResult, 0, "ResolvedFunctions",
                (mxArray *)c_emlrtMexFcnResolvedFunctionsI());
  emlrtSetField(xResult, 0, "Checksum",
                emlrtMxCreateString("sx6LC4xzLIJPcA9Z1HGvHG"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  emlrtSetField(xResult, 0, "AuxData",
                emlrtMxCreateRowVectorUINT8((const uint8_T *)&v, 216U));
  return xResult;
}

/* End of code generation (_coder_calc_MCG_0625_info.c) */
