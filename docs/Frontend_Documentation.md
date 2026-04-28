# Deep Frontend Documentation

This document provides a **deep, code-level analysis** of the frontend application. It abandons repetitive summaries in favor of extracting the **exact state variables, props, API endpoints, UI structures, and type definitions** directly from the source code, providing a true technical map of the application.


## Pages (`frontend/app/pages`)


### `Login.vue`

- **State Management (Stores Used):** `AuthStore`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/class/[id].vue`

- **Composables Used:** `useClassGroup`

- **UI Structure/Elements:** Contains Data Table Display.


---


### `admin/class/create.vue`

- **Composables Used:** `useUser, useClassGroup, useFormation`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/class/edit/[id].vue`

- **Composables Used:** `useUser, useClassGroup, useFormation`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/class/index.vue`

- **Composables Used:** `usePagination, useClassGroup`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `admin/formation/[id].vue`

- **Composables Used:** `useFormation`


---


### `admin/formation/create.vue`

- **Composables Used:** `useGradeLevel, useFormation`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/formation/edit/[id].vue`

- **Composables Used:** `useGradeLevel, useFormation`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/formation/index.vue`

- **Composables Used:** `usePagination, useFormation`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `admin/grade-level/[id].vue`

- **Composables Used:** `useGradeLevel`


---


### `admin/grade-level/create.vue`

- **Composables Used:** `useGradeLevel, useScholarYear`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/grade-level/edit/[id].vue`

- **Composables Used:** `useGradeLevel, useScholarYear`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/grade-level/index.vue`

- **Composables Used:** `useGradeLevel, usePagination`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `admin/index.vue`

- **State Management (Stores Used):** `AdminStore`

- **Composables Used:** `useUser`

- **UI Structure/Elements:** Contains Data Table Display.


---


### `admin/language/[id].vue`

- **Composables Used:** `useLanguage`


---


### `admin/language/create.vue`

- **Composables Used:** `useLanguage`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/language/edit/[id].vue`

- **Composables Used:** `useLanguage`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/language/index.vue`

- **Composables Used:** `usePagination, useLanguage`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `admin/level/create.vue`

- **Composables Used:** `useLevel`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/level/edit/[id].vue`

- **Composables Used:** `useLevel`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/level/index.vue`

- **Composables Used:** `useLevel, usePagination`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `admin/runner-version/[id].vue`

- **Composables Used:** `useRunnerVersion`


---


### `admin/runner-version/create.vue`

- **Composables Used:** `useRunnerVersion, useRunner`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/runner-version/edit/[id].vue`

- **Composables Used:** `useRunnerVersion, useRunner`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/runner-version/index.vue`

- **Composables Used:** `useRunnerVersion, usePagination, useRunner`

- **UI Structure/Elements:** Contains Form/Input Interface, Data Table Display, Pagination Component, Modal/Dialog Window.


---


### `admin/runner/[id].vue`

- **Composables Used:** `useRunner`

- **UI Structure/Elements:** Contains Data Table Display.


---


### `admin/runner/create.vue`

- **Composables Used:** `useRunner`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/runner/edit/[id].vue`

- **Composables Used:** `useRunner`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/runner/index.vue`

- **Composables Used:** `usePagination, useRunner`

- **UI Structure/Elements:** Contains Form/Input Interface, Data Table Display, Pagination Component, Modal/Dialog Window.


---


### `admin/scholar-year/[id].vue`

- **Composables Used:** `useScholarYear`


---


### `admin/scholar-year/create.vue`

- **Composables Used:** `useScholarYear`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/scholar-year/edit/[id].vue`

- **Composables Used:** `useScholarYear`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/scholar-year/index.vue`

- **Composables Used:** `useScholarYear, usePagination`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `admin/skill/[id].vue`

- **Composables Used:** `useSkill`


---


### `admin/skill/create.vue`

- **Composables Used:** `useLevel, useSkill, useFormation`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/skill/edit/[id].vue`

- **Composables Used:** `useLevel, useSkill, useFormation`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/skill/index.vue`

- **Composables Used:** `useSkill, usePagination`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `admin/sprint/[id].vue`

- **Composables Used:** `useSprint`


---


### `admin/sprint/create.vue`

- **Composables Used:** `useSprint, useSkill, useFormation`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/sprint/edit/[id].vue`

- **Composables Used:** `useSprint, useSkill, useFormation`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/sprint/index.vue`

- **Composables Used:** `useSprint, usePagination`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `admin/stack/[id].vue`

- **Composables Used:** `useStack`

- **UI Structure/Elements:** Contains Data Table Display.


---


### `admin/stack/create.vue`

- **Composables Used:** `useStack, useRunnerVersion`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/stack/edit/[id].vue`

- **Composables Used:** `useStack, useRunnerVersion`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/stack/index.vue`

- **Composables Used:** `useStack, usePagination`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `admin/user/[role]/[id]/edit.vue`

- **Composables Used:** `useUser`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/user/admin/[id].vue`

- **Composables Used:** `useUser`


---


### `admin/user/create.vue`

- **Composables Used:** `useUser`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `admin/user/index.vue`

- **Composables Used:** `useUser, usePagination`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `admin/user/student/[id].vue`

- **Composables Used:** `useUser`


---


### `admin/user/teacher/[id].vue`

- **Composables Used:** `useUser`


---


### `student/briefs/index.vue`

- **Composables Used:** `useSubmission, useBrief`


---


### `student/correction/index.vue`

- **Composables Used:** `useSubmission, useCorrection`


---


### `student/index.vue`

- **Composables Used:** `useUser, useStudent`


---


### `student/submission/[id]/create.vue`

- **Composables Used:** `useSubmission, useBrief`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `student/submission/index.vue`

- **Composables Used:** `useSubmission, useCorrection, useProblemSubmission`


---


### `teacher/brief/[id].vue`

- **Composables Used:** `useBriefVersion, useBrief`

- **UI Structure/Elements:** Contains Sidebar Navigation, Modal/Dialog Window.


---


### `teacher/brief/create.vue`

- **Composables Used:** `useSprint, useStack, useBrief, useClassGroup`

- **UI Structure/Elements:** Contains Form/Input Interface, Rich Text Editor.


---


### `teacher/brief/edit/[id].vue`

- **Composables Used:** `useSprint, useStack, useBrief, useClassGroup`

- **UI Structure/Elements:** Contains Form/Input Interface, Rich Text Editor.


---


### `teacher/brief/index.vue`

- **Composables Used:** `useBrief`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `teacher/index.vue`

- **State Management (Stores Used):** `TeacherStore, AuthStore`


---


### `teacher/problems/[id].vue`

- **Composables Used:** `useProblem, useProblemTestCase`

- **UI Structure/Elements:** Contains Modal/Dialog Window.


---


### `teacher/problems/create.vue`

- **Composables Used:** `useProblem, useBrief, useLanguage`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `teacher/problems/edit/[id].vue`

- **Composables Used:** `useProblem, useBrief, useLanguage`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `teacher/problems/index.vue`

- **Composables Used:** `useProblem, usePagination`

- **UI Structure/Elements:** Contains Data Table Display, Modal/Dialog Window.


---


### `teacher/submission/index.vue`

- **Composables Used:** `useCorrection, useClassGroup, useSubmission, useUser, useBrief`

- **UI Structure/Elements:** Contains Sidebar Navigation.


---


## Stores (`frontend/stores`)


### `admin.ts`

- **Actions/Methods:** `fetchStatistics`


---


### `auth.ts`

- **Actions/Methods:** `fetchUser, login, logout, checkTockenExpiration`


---


### `brief.ts`

- **Actions/Methods:** `fetchStudentBrief, fetchClassGroupBriefs, fetchBrief, restoreBrief, fetchBriefSkillLevels, fetchBriefs, updateBrief, fetchStudentBriefs, archiveBrief, createBrief`


---


### `brief_version.ts`

- **Actions/Methods:** `fetchBriefVersionsForBrief, restoreBriefVersion, createBriefVersion, archiveBriefVersion, fetchBriefVersion, fetchBriefVersions`


---


### `class_group.ts`

- **Actions/Methods:** `fetchTeacherClassGroups, restoreClassGroup, fetchClassGroups, updateClassGroup, createClassGroup, archiveClassGroup, fetchClassGroup`


---


### `correction.ts`

- **Actions/Methods:** `fetchStudentCorrection, fetchStudentCorrectionsById, fetchStudentCorrections, fetchCorrection`


---


### `formation.ts`

- **Actions/Methods:** `fetchFormations, archiveFormation, createFormation, updateFormation, fetchFormation, restoreFormation`


---


### `grade_level.ts`

- **Actions/Methods:** `archiveGradeLevel, updateGradeLevel, restoreGradeLevel, createGradeLevel, fetchGradeLevel, fetchGradeLevels`


---


### `language.ts`

- **Actions/Methods:** `fetchAllLanguages, updateLanguage, restoreLanguage, archiveLanguage, createLanguage, fetchLanguages, fetchLanguage`


---


### `level.ts`

- **Actions/Methods:** `restoreLevel, archiveLevel, createLevel, updateLevel, fetchLevels, fetchLevel`


---


### `problem.ts`

- **Actions/Methods:** `archiveProblem, updateProblem, fetchProblems, fetchProblem, restoreProblem, createProblem`


---


### `problem_submission.ts`

- **Actions/Methods:** `storeProblemSubmissions`


---


### `problem_test_case.ts`

- **Actions/Methods:** `createTestCase, fetchTestCase, restoreTestCase, fetchTestCases, archiveTestCase`


---


### `runner.ts`

- **Actions/Methods:** `fetchRunner, deleteRunner, fetchRunners, createRunner, updateRunner, fetchAllRunners`


---


### `runner_version.ts`

- **Actions/Methods:** `createRunnerVersion, fetchRunnerVersions, deleteRunnerVersion, fetchAllRunnerVersions, fetchRunnerVersion`


---


### `scholar_year.ts`

- **Actions/Methods:** `archiveScholarYear, fetchScholarYears, updateScholarYear, createScholarYear, restoreScholarYear, fetchScholarYear`


---


### `skill.ts`

- **Actions/Methods:** `archiveSkill, fetchSkill, updateSkill, createSkill, fetchSkills, restoreSkill, fetchByFormation`


---


### `sprint.ts`

- **Actions/Methods:** `archiveSprint, restoreSprint, fetchSprints, createSprint, fetchSprintSkills, updateSprint, fetchSprint, fetchSprintsByFormationId`


---


### `stack.ts`

- **Actions/Methods:** `fetchAllStacks, createStack, updateStack, restoreStack, archiveStack, fetchStacks, fetchStack`


---


### `student.ts`

- **State Variables:** `loading`

- **Actions/Methods:** `fetchDashboardData`


---


### `submission.ts`

- **Actions/Methods:** `fetchStudentSubmissions, fetchSubmissionsByStudentId, fetchStudentBriefSubmission, fetchSubmission, createSubmission`


---


### `teacher.ts`

- **Actions/Methods:** `fetchStatistics`


---


### `toast.ts`

- **Actions/Methods:** `remove, push`


---


### `user.ts`

- **Actions/Methods:** `restoreUser, fetchUsers, updateUser, fetchTeacherStudents, fetchTeachersByRole, createUser, fetchStudents, archiveUser, fetchUser`


---


## Middleware (`frontend/app/middleware`)


### `admin.ts`

- **Logic Flow:** Validates user role authorization against the required access level.


---


### `auth.ts`

- **Logic Flow:** Validates authentication token/cookies presence.


---


### `guest.ts`

- **Logic Flow:** Validates authentication token/cookies presence.

- **Logic Flow:** Validates user role authorization against the required access level.


---


### `student.ts`

- **Logic Flow:** Validates user role authorization against the required access level.


---


### `teacher.ts`

- **Logic Flow:** Validates user role authorization against the required access level.


---


## Utils (`frontend/app/utils`)


### `api.ts`

- **Exported Functions:** `useApi`

- **Logic:** Wraps HTTP requests or Fetch API.


---


### `jwt.ts`

- **Exported Functions:** `decodeJwt`

- **Logic:** Performs JWT manipulation or decoding.


---


## Composables (`frontend/app/composables`)


### `usePagination.ts`

- **Logic:** Wraps HTTP requests or Fetch API.


---


## Components (`frontend/app/components`)


### `AdminSidebar.vue`

- **State Management (Stores Used):** `AuthStore`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `Pagination.vue`

- **Component Props:** `{ meta: { current_page: number last_page: number next_page_url: string | null prev_page_url: string | null from: number to: number total: number }, per_page: number }`

- **Emits Events:** `{ (e: 'change', page: number): void (e: 'perPage', value: number): void }`


---


### `QuillEditor.client.vue`

- **Component Props:** `{ modelValue: string }`

- **Emits Events:** `{ (e: 'update:modelValue', value: string): void }`

- **UI Structure/Elements:** Contains Rich Text Editor.


---


### `StudentSidebar.vue`

- **State Management (Stores Used):** `AuthStore`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `TeacherSidebar.vue`

- **State Management (Stores Used):** `AuthStore`

- **UI Structure/Elements:** Contains Form/Input Interface.


---


### `Toast.vue`

- **State Management (Stores Used):** `ToastStore`


---


### `teacher/BriefVersionCreateModal.vue`

- **Composables Used:** `useBriefVersion, useLanguage`

- **Component Props:** `{ briefId: number; isOpen: boolean; }`

- **Emits Events:** `'close', 'success'`

- **UI Structure/Elements:** Contains Modal/Dialog Window.


---


### `teacher/BriefVersionDetailsModal.vue`

- **Component Props:** `{ version: BriefVersion | null; isOpen: boolean; }`

- **Emits Events:** `'close'`

- **UI Structure/Elements:** Contains Modal/Dialog Window.


---


### `teacher/BriefVersionList.vue`

- **Composables Used:** `useBriefVersion`

- **Component Props:** `{ briefId: number; }`

- **Emits Events:** `'view-details', 'archive', 'restore'`

- **UI Structure/Elements:** Contains Pagination Component.


---


## Layouts (`frontend/app/layouts`)


### `Login.vue`

- *No complex structural logic found or purely presentational file.*


---


### `admin.vue`

- **UI Structure/Elements:** Contains Sidebar Navigation.


---


### `student.vue`

- **UI Structure/Elements:** Contains Sidebar Navigation.


---


### `teacher.vue`

- **UI Structure/Elements:** Contains Sidebar Navigation.


---


## Types (`frontend/types`)


### `api.ts`

- **Interface/Type `AuthResponse` Properties:** `access_token, token_type, user`

- **Interface/Type `meta` Properties:** `current_page, last_page, next_page_url, prev_page_url, total, per_page, from, to`


---


### `brief.ts`

- **Interface/Type `BriefSkillLevel` Properties:** `id, brief_id, skill_id, level_id, created_at, updated_at, deleted_at, skill, level`

- **Interface/Type `BriefVersion` Properties:** `id, brief_id, version, architecture_rules, test_config, created_at, updated_at`

- **Interface/Type `Brief` Properties:** `id, sprint_id, class_group_id, stack_id, teacher_id, title, description, content, is_collective, start_date, end_date, created_at, updated_at, deleted_at, is_active, sprint, class_group, teacher, stack, brief_skill_levels, problems?, brief_versions?`


---


### `brief_version.ts`

- **Interface/Type `ArchitectureRule` Properties:** `required, optional, forbidden, structure, patterns, type, path, value`

- **Interface/Type `HttpTest` Properties:** `name, method, url, headers?, name, value`

- **Interface/Type `BrowserStep` Properties:** `action, url?, selector?`

- **Interface/Type `BrowserTest` Properties:** `name, steps, expected, title?, text?`

- **Interface/Type `FunctionTest` Properties:** `name, input, expected_output`

- **Interface/Type `TestConfig` Properties:** `type, timeout_seconds, retries, base_path?, language?, tests`

- **Interface/Type `BriefVersion` Properties:** `id, brief_id, version, architecture_rules, test_config, created_at, updated_at, deleted_at, brief?`


---


### `class_group.ts`

- **Interface/Type `ClassGroup` Properties:** `id, formation_id, name, image_url, capacity, description, created_at, updated_at, deleted_at, students_count, is_active, formation, students, main_teacher, sub_teacher`


---


### `correction.ts`

- **Interface/Type `CorrectionDetail` Properties:** `id, correction_id, brief_skill_level_id, grade, created_at, updated_at, deleted_at, brief_skill_level`

- **Interface/Type `Correction` Properties:** `id, brief_id, submission_id, student_id, teacher_id, message, result, created_at, updated_at, deleted_at, brief, teacher, student, correction_details`


---


### `formation.ts`

- **Interface/Type `Formation` Properties:** `id, grade_level_id, grade_name, title, description, duration, capacity, created_at, updated_at, deleted_at, class_groups_count, students_count, is_active, is_full, is_empty, is_almost_full, is_nearly_empty, class_groups, grade_level?`


---


### `grade_level.ts`

- **Interface/Type `Grade` Properties:** `id, scholar_year_id, scholar_year, name, capacity, description, created_at, updated_at, deleted_at, formations_count, students_count, is_active, is_full, is_empty, is_almost_full, is_nearly_empty, formations`


---


### `language.ts`

- **Interface/Type `Language` Properties:** `id, name, docker_image, compile_command, run_command, created_at, updated_at, deleted_at`


---


### `level.ts`

- **Interface/Type `Level` Properties:** `id, name, description, order, created_at, updated_at, deleted_at, is_active`


---


### `pagination.ts`

- *No complex structural logic found or purely presentational file.*


---


### `problem.ts`

- **Interface/Type `Problem` Properties:** `id, brief_id, brief_skill_level_id, language_id, title, description, hidden_header, hidden_footer, skeleton_code, order_index, created_at, updated_at, deleted_at, brief?, language?, test_cases?, brief_skill_level?, id, skill_id, level_id, skill, id, name`


---


### `problem_submission.ts`

- **Interface/Type `ProblemSubmission` Properties:** `id, submission_id, problem_id, code, result?, status, created_at, updated_at, deleted_at, problem`


---


### `problem_test_case.ts`

- **Interface/Type `ProblemTestCase` Properties:** `id, problem_id, input, expected_output, is_hidden, created_at, updated_at, deleted_at, problem?`


---


### `runner.ts`

- **Interface/Type `Runner` Properties:** `id, name, description, type, status, created_at, updated_at, versions?`


---


### `runner_version.ts`

- **Interface/Type `RunnerVersion` Properties:** `id, runner_id, version, docker_image, default_config, status, is_default, created_at, updated_at, deleted_at, runner?`


---


### `scholar_year.ts`

- **Interface/Type `Year` Properties:** `id, start_year, end_year, capacity, created_at, updated_at, deleted_at, grade_levels_count, students_count, is_active, is_current, is_past, is_upcoming, grade_levels`


---


### `skill.ts`

- **Interface/Type `SkillLevel` Properties:** `skill_id, level_id, criteria, created_at, updated_at, deleted_at, level`

- **Interface/Type `Skill` Properties:** `id, formation_id, code, title, description, created_at, updated_at, deleted_at, is_active, formation?, skill_levels?`


---


### `sprint.ts`

- **Interface/Type `SprintSkill` Properties:** `sprint_id, skill_id, created_at, updated_at, deleted_at, skill`

- **Interface/Type `Sprint` Properties:** `id, formation_id, name, description, start_date, end_date, created_at, updated_at, deleted_at, is_active, formation?, sprint_skills?`


---


### `stack.ts`

- **Interface/Type `Stack` Properties:** `id, name, description, stack_runners?, created_at?, updated_at?, deleted_at?`

- **Interface/Type `StackRunner` Properties:** `id, stack_id, runner_version_id, priority, runner_version?, created_at?, updated_at?, deleted_at?`


---


### `student.ts`

- **Interface/Type `DashboardStats` Properties:** `total_missions, completed_missions, total_belly, rank, success_rate`

- **Interface/Type `RecentActivity` Properties:** `id, type, title, date, status, icon`

- **Interface/Type `DashboardData` Properties:** `stats, skills_progress, recent_activity`


---


### `submission.ts`

- **Interface/Type `EvaluationJob` Properties:** `id, submission_id, status, result?, success, architecture, score, missing, forbidden, structure_errors, pattern_errors, optional_found`

- **Interface/Type `ProblemSubmissionJob` Properties:** `id, submission_id, status, result?, submissions, problem_id, score, tests, test_case_id, passed, input, expected, actual`

- **Interface/Type `Submission` Properties:** `id, brief_id, student_id, squad_id, message, link, created_at, updated_at, deleted_at, student, squad, brief, evaluation_job?, problem_submissions?, problem_submission_job?, correction?`


---


### `toast.ts`

- **Interface/Type `Toast` Properties:** `id, type, message`


---


### `user.ts`

- **Interface/Type `ClassTeacher` Properties:** `id, class_group_id, teacher_id, role, assigned_at, created_at, updated_at, deleted_at, class_group, teacher`

- **Interface/Type `User` Properties:** `id, first_name, last_name, age, email, cin, phone, role, id_class, created_at, updated_at, deleted_at, is_active, class_teachers?, class_group?`

- **Interface/Type `UserData` Properties:** `users, archived_users`


---

