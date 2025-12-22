# PennyPilot Feature Implementation Plan

## Current Architecture Analysis

### State Management
- **Riverpod** for dependency injection and state management
- **SharedPreferences** for simple key-value persistence (theme, settings)
- **Flutter Secure Storage** for OAuth tokens
- **Isar** for local database (transactions, subscriptions, etc.)

### Current Issues Identified

1. **No Onboarding Persistence**: `app.dart` has hardcoded `isOnboarded = false`
2. **No Transaction Editing**: Transaction details screen has TODO placeholders
3. **No Factory Reset**: Privacy screen has "Wipe All Data" but doesn't separate accounts from financial data
4. **Account Persistence**: AuthService stores accounts in secure storage, but may be getting cleared
5. **Email Scanning**: Basic implementation exists but needs better receipt detection

## Implementation Strategy

### Phase 1: State Separation & Persistence (Foundation)
**Goal**: Clean separation of concerns for different types of state

#### 1.1 Create App State Provider
- Create `lib/src/presentation/providers/app_state_provider.dart`
- Manage: `hasCompletedOnboarding`, `lastAppVersion`, `firstLaunchDate`
- Use SharedPreferences for persistence

#### 1.2 Update Onboarding Flow
- Modify `app.dart` to check `hasCompletedOnboarding` from provider
- Update `onboarding_screen.dart` to set flag on completion
- Ensure onboarding always shows on first launch, regardless of auth state

### Phase 2: Full Transaction Editing
**Goal**: Complete CRUD operations for transactions

#### 2.1 Create Edit Transaction Screen
- Create `lib/src/presentation/screens/transactions/edit_transaction_screen.dart`
- Full form with all fields: amount, date, merchant, category, notes, recurring flag
- Add `isManuallyEdited` boolean field to `TransactionModel`
- Add `manualEditTimestamp` DateTime field to `TransactionModel`

#### 2.2 Update Transaction Repository
- Add `updateTransaction()` method
- Ensure proper Isar write transactions
- Set `isManuallyEdited = true` and `updatedAt` on edits

#### 2.3 Update UI
- Wire edit button in `transaction_details_screen.dart`
- Show "Manually Edited" badge in transaction lists
- Add visual indicator for edited transactions

### Phase 3: Factory Reset with Account Preservation
**Goal**: Separate data reset from account management

#### 3.1 Enhance DatabaseService
- Add `resetFinancialData()` method that:
  - Clears transactions
  - Clears subscriptions
  - Clears receipts
  - Clears extraction metadata
  - Preserves categories (or resets to defaults)
  - Does NOT touch auth tokens

#### 3.2 Update Privacy Screen
- Rename "Wipe All Data" to "Reset Financial Data"
- Add new "Factory Reset" option that:
  - Clears financial data
  - Clears auth tokens
  - Resets onboarding flag
  - Requires double confirmation

#### 3.3 Add Confirmation Dialogs
- Two-step confirmation for dangerous actions
- Clear messaging about what will be deleted

### Phase 4: Account Management Screen
**Goal**: Dedicated UI for managing connected email accounts

#### 4.1 Create Manage Accounts Screen
- Create `lib/src/presentation/screens/settings/manage_accounts_screen.dart`
- List all connected accounts
- Show last sync time per account
- Manual disconnect per account
- Re-sync button per account
- Add account button

#### 4.2 Enhance AuthService
- Add `getLastSyncTime(String email)` method
- Store sync timestamps in secure storage
- Add `refreshAccount(String email)` method
- Ensure accounts persist across app restarts

#### 4.3 Update Settings Navigation
- Add "Manage Email Accounts" option in settings
- Move account management out of privacy screen

### Phase 5: Improved Email Scanning
**Goal**: Better receipt detection with stronger heuristics

#### 5.1 Create Receipt Detection Service
- Create `lib/src/services/receipt_detection_service.dart`
- Implement multi-signal detection:
  - **Sender domain patterns**: `@amazon.com`, `@uber.com`, `receipts@`, `noreply@`, etc.
  - **Subject keywords**: "receipt", "invoice", "order confirmation", "payment", "subscription"
  - **HTML markers**: Look for invoice tables, price patterns, order numbers
  - **Amount detection**: Regex for currency amounts
  - **Merchant detection**: Known merchant patterns

#### 5.2 Update Email Service
- Integrate new detection service
- Improve search query to be more inclusive
- Add configurable sensitivity (prefer recall over precision)
- Log detection confidence scores

#### 5.3 Add Detection Configuration
- Allow users to adjust sensitivity
- Whitelist/blacklist sender domains
- Custom keyword additions

### Phase 6: Data Model Updates
**Goal**: Support new features with proper schema

#### 6.1 Update TransactionModel
```dart
// Add fields:
bool isManuallyEdited = false;
DateTime? manualEditTimestamp;
```

#### 6.2 Create Account Sync Model
```dart
@collection
class AccountSyncModel {
  Id id = Isar.autoIncrement;
  late String email;
  late DateTime lastSyncTime;
  int messagesProcessed = 0;
  String? lastError;
}
```

#### 6.3 Update DatabaseService
- Add new schema to Isar initialization
- Handle migrations gracefully

## Implementation Order

### Sprint 1: Foundation (Critical)
1. ✅ App State Provider
2. ✅ Onboarding Persistence
3. ✅ Account Persistence Verification

### Sprint 2: Editing (Critical)
1. ✅ Transaction Model Updates
2. ✅ Edit Transaction Screen
3. ✅ Repository Updates
4. ✅ UI Integration

### Sprint 3: Data Management (Important)
1. ✅ Factory Reset Implementation
2. ✅ Privacy Screen Updates
3. ✅ Confirmation Flows

### Sprint 4: Account Management (Important)
1. ✅ Manage Accounts Screen
2. ✅ AuthService Enhancements
3. ✅ Settings Integration

### Sprint 5: Email Scanning (Enhancement)
1. ✅ Receipt Detection Service
2. ✅ Email Service Updates
3. ✅ Configuration UI

## Testing Checklist

### Onboarding
- [ ] First launch shows onboarding
- [ ] Completing onboarding sets flag
- [ ] Subsequent launches skip onboarding
- [ ] Auth doesn't bypass onboarding

### Transaction Editing
- [ ] Can edit all fields
- [ ] Changes persist
- [ ] Edited transactions show badge
- [ ] Manual edits override email data

### Data Reset
- [ ] Financial reset clears transactions
- [ ] Financial reset preserves accounts
- [ ] Factory reset clears everything
- [ ] Confirmations work properly

### Account Management
- [ ] Accounts persist across restarts
- [ ] Can disconnect individual accounts
- [ ] Can add multiple accounts
- [ ] Last sync time displays correctly

### Email Scanning
- [ ] Better receipt detection
- [ ] Fewer false negatives
- [ ] Configurable sensitivity
- [ ] Dry run works correctly

## Risk Mitigation

1. **Data Loss**: Always backup before destructive operations
2. **Migration Issues**: Test Isar schema changes thoroughly
3. **Auth Token Loss**: Ensure secure storage is properly configured
4. **Performance**: Batch operations for large datasets
5. **User Confusion**: Clear UI messaging and confirmations

## Success Criteria

✅ Users can edit any transaction field
✅ Edits persist and are clearly marked
✅ Onboarding always shows on first launch
✅ Connected accounts survive app restarts
✅ Factory reset is available but separate from data reset
✅ Email scanning catches more receipts
✅ No repeated logins required
✅ Predictable, stable UX
