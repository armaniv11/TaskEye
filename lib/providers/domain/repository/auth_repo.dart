abstract class AuthRepo {
  Future<void> sendOtp(final mobNo);
  Future<void> verifyOTP(final String otp);
}
